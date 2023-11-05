import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_celebrare/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PickMyImage _pickMyImage = PickMyImage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Add Image/Icon",
          style: TextStyle(color: Colors.black45),
        ),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Upload Image"),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () async {
                      await _pickMyImage.pickImageFromGallery();
                      setState(() {
                        print("Image Picked");
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          "Choose from device",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: _pickMyImage.file != null
                    ? Image.file(
                        File(_pickMyImage.file!.path),
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
