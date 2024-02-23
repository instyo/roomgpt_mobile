import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

class ResultScreen extends StatelessWidget {
  final File file;
  final String resultUrl;

  const ResultScreen({
    super.key,
    required this.file,
    required this.resultUrl,
  });

  static void open(
    BuildContext context, {
    required File file,
    required String resultUrl,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          file: file,
          resultUrl: resultUrl,
        ),
      ),
    );
  }

  Future<void> saveImageToGallery(BuildContext context) async {
    try {
      await GallerySaver.saveImage(resultUrl);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Image saved to gallery",
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint(">> Error : $e");
      debugPrint(">> Stack : $stack");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generated"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 420,
                ),
                child: ImageCompareSlider(
                  itemOne: Image.network(
                    resultUrl,
                    height: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
                  itemTwo: Image.file(file),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(44),
              ),
              onPressed: () => saveImageToGallery(context),
              child: const Text("Save Image"),
            ),
          ],
        ),
      ),
    );
  }
}
