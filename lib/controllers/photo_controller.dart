import 'dart:io';

import 'package:astra_tech/models/photo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../utils/dialogs.dart';

class PhotoController extends GetxController {
  final _photoRef = FirebaseStorage.instance.ref().child('photos');
  List<Photo>? photos;
  Photo? obj;

  Future<void> list() async {
    final result = await _photoRef.list();
    photos = await Future.wait(result.items.map((ref) async {
      return await Photo.fromRef(ref: ref);
    }).toList());
    update();
  }

  Future<void> add({required File image}) async {
    Dialogs.loading(content: 'Uploading');
    var filename = image.path.split('/').last;
    try {
      // check if reference already exists
      await _photoRef.child(filename).getDownloadURL();

      // change name until we find a unique one
      final index = filename.lastIndexOf('.');
      final name = filename.substring(0, index);
      final ext = filename.substring(index);
      var i = 2;
      while (true) {
        // throws a FirebaseException with 'object-not-found' code
        // when file with this name is not found
        filename = '$name$i$ext';
        await _photoRef.child(filename).getDownloadURL();
      }
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        await _photoRef.child(filename).putFile(image);
        Get.back();
        Get.offNamed('/photo/$filename');
        list();
      } else {
        Get.back();
        Get.snackbar(
          'Something went wrong!',
          'Please try again later',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Something went wrong!',
        'Please try again later',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> getObj() async {
    obj = await Photo.fromRef(ref: _photoRef.child(Get.parameters['name']!));
    update();
  }

  Future<void> delete() async {
    Dialogs.loading(content: 'Deleting');
    await _photoRef.child(Get.parameters['name']!).delete();
    Get.back();
    Get.back();
    Dialogs.loading(content: 'Loading');
    await list();
    Get.back();
  }
}

class PhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhotoController());
  }
}
