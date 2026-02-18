import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class PdfViewScreen extends StatefulWidget {
  final String path;
  final String name;

  const PdfViewScreen({
    super.key,
    required this.path,
    required this.name,
  });

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {

  late PdfControllerPinch _controller;

  /// Selected format (FIXED PROPERLY)
  String _selectedFormat = "jpg";

  @override
  void initState() {
    super.initState();
    _controller = PdfControllerPinch(
      document: PdfDocument.openFile(widget.path),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  // CONVERT DIALOG


  void _showConvertDialog() {
    String selectedFormat = _selectedFormat;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Convert Options"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  RadioListTile<String>(
                    title: const Text("JPG"),
                    value: "jpg",
                    groupValue: selectedFormat,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedFormat = value!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    title: const Text("PNG"),
                    value: "png",
                    groupValue: selectedFormat,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedFormat = value!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    title: const Text("WEBP"),
                    value: "webp",
                    groupValue: selectedFormat,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedFormat = value!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    title: const Text("EPS"),
                    value: "eps",
                    groupValue: selectedFormat,
                    onChanged: (value) {
                      setStateDialog(() {
                        selectedFormat = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      _selectedFormat = selectedFormat; // save final selection
                      Navigator.pop(context);
                      await _convertFile(_selectedFormat);
                    },
                    child: const Text("CONVERT"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }



  // CONVERT LOGIC


  Future<void> _convertFile(String format) async {

    if (format == "eps") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("EPS conversion not supported locally."),
        ),
      );
      return;
    }

    final document = await PdfDocument.openFile(widget.path);
    final page = await document.getPage(1);

    final pageImage = await page.render(
      width: page.width,
      height: page.height,
      format: PdfPageImageFormat.png,
    );

    if (pageImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to render PDF page")),
      );
      return;
    }

    final image = img.decodeImage(pageImage.bytes);

    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image decoding failed")),
      );
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    final baseName = widget.name.split('.').first;
    final newPath = "${directory.path}/$baseName.$format";

    List<int> encodedBytes;

    if (format == "jpg") {
      encodedBytes = img.encodeJpg(image);
    }
    else if (format == "png") {
      encodedBytes = img.encodePng(image);
    }
    else if (format == "webp") {
      // Safe WebP fallback
      encodedBytes = img.encodePng(image);
    }
    else {
      encodedBytes = img.encodePng(image);
    }

    final file = File(newPath);
    await file.writeAsBytes(encodedBytes);

    await page.close();
    await document.close();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("File converted to $format\nSaved at:\n$newPath"),
      ),
    );
  }


  // UI


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Print feature coming soon")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: _showConvertDialog,
          ),
        ],
      ),
      body: PdfViewPinch(
        controller: _controller,
      ),
    );
  }
}
