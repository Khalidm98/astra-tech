import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/widgets.dart';
import '../../controllers/photo_controller.dart';
import '../../network/api_auth.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({super.key});

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  void initState() {
    super.initState();
    Get.find<PhotoController>().list();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser!.email!),
        actions: const [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: AuthAPI.logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: GetBuilder<PhotoController>(builder: (controller) {
        if (controller.photos == null) return Widgets.loading;

        final photos = controller.photos!;
        if (photos.isEmpty)
          return const Center(
            child: Text(
              'There is no photos.\nAdd a new one.',
              textAlign: TextAlign.center,
            ),
          );

        return ListView.separated(
          itemCount: photos.length,
          separatorBuilder: (_, __) => Widgets.listSeparator,
          itemBuilder: (_, index) {
            final photo = photos[index];
            return ListTile(
              leading: Image.network(photo.url!),
              title: Text(photo.name!),
              subtitle: Text(photo.created.toString().substring(0, 19)),
              onTap: () => Get.toNamed('/photo/${photo.name}'),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed('/photo/add'),
      ),
    );
  }
}
