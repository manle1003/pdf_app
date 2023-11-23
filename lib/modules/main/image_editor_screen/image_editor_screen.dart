import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class ImageEditorScreen extends StatefulWidget {
  final String imagePath;

  const ImageEditorScreen({
    required this.imagePath,
    Key? key,
  });

  @override
  createState() => _ImageEditorScreenState();
}

class _ImageEditorScreenState extends State<ImageEditorScreen> {
  Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    loadImage(widget.imagePath);
  }

  void loadImage(String path) async {
    File imageFile = File(path);
    if (imageFile.existsSync()) {
      List<int> imageBytes = await imageFile.readAsBytes();
      setState(() => imageData = Uint8List.fromList(imageBytes));
      final editedImage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageEditor(
            image: imageData,
          ),
        ),
      );
      if (editedImage != null) {
        imageData = editedImage;
        setState(() {});
      }
    } else {
      print("File does not exist: $path");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImageEditor Example"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageData != null) Image.memory(imageData!),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
  
}
