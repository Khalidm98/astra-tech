import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/widgets.dart';
import '../../controllers/photo_controller.dart';

class PhotoInfo extends StatefulWidget {
  const PhotoInfo({super.key});

  @override
  State<PhotoInfo> createState() => _PhotoInfoState();
}

class _PhotoInfoState extends State<PhotoInfo> {
  final _controller = Get.find<PhotoController>();

  @override
  void initState() {
    super.initState();
    _controller.getObj();
  }

  @override
  void dispose() {
    _controller.obj = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Info'),
          actions: _controller.obj == null
              ? null
              : [
                  IconButton(
                    onPressed: _controller.delete,
                    icon: const Icon(Icons.delete),
                    tooltip: 'Delete',
                  ),
                ],
        ),
        body: _controller.obj == null
            ? Widgets.loading
            : Padding(
                padding: Widgets.marginAll,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.drive_file_rename_outline),
                        Widgets.spacingHorizontal,
                        Text(_controller.obj!.name!),
                      ],
                    ),
                    Widgets.spacingVertical,
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        Widgets.spacingHorizontal,
                        Text(_controller.obj!.created
                            .toString()
                            .substring(0, 19)),
                      ],
                    ),
                    Widgets.spacingVertical,
                    Expanded(child: Image.network(_controller.obj!.url!)),
                  ],
                ),
              ),
      );
    });
  }
}
