import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/widgets.dart';
import '../../controllers/photo_controller.dart';

class PhotoAdd extends StatefulWidget {
  const PhotoAdd({super.key});

  @override
  State<PhotoAdd> createState() => _PhotoAddState();
}

class _PhotoAddState extends State<PhotoAdd> {
  final _controller = Get.find<PhotoController>();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Photo')),
      body: Padding(
        padding: Widgets.marginAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: _selectPhoto,
              icon: const Icon(Icons.photo),
              label: const Text('Select from gallery'),
            ),
            Widgets.spacingVertical,
            Expanded(
              child: _image == null ? const Placeholder() : Image.file(_image!),
            ),
            Widgets.spacingVertical,
            if (_image != null)
              ElevatedButton.icon(
                onPressed: () => _controller.add(image: _image!),
                icon: const Icon(Icons.upload),
                label: const Text('Add photo'),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _image = File(image.path);
    });
  }
}
