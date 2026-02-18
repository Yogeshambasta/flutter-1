import 'dart:io';
import 'dart:typed_data';
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

  // ===============================
  // SAVE AS DIALOG
  // ===============================

  void _showConvertDialog() {
    String selectedFormat = "jpg";

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Convert Options"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  _buildOption("JPG", "jpg", selectedFormat, setStateDialog),
                  _buildOption("PNG", "png", selectedFormat, setStateDialog),
                  _buildOption("WEBP", "webp", selectedFormat, setStateDialog),
                  _buildOption("EPS", "eps", selectedFormat, setStateDialog),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await _convertFile(selectedFormat);
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

  Widget _buildOption(
      String title,
      String value,
      String selected,
      Function setStateDialog,
      ) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: selected,
      onChanged: (val) {
        setStateDialog(() {
          selected = val!;
        });
      },
    );
  }

  // ===============================
  // CONVERT LOGIC
  // ===============================

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

    final bytes = pageImage!.bytes;

    img.Image? image = img.decodeImage(bytes);

    final directory = await getApplicationDocumentsDirectory();
    final newPath =
        "${directory.path}/${widget.name.split('.').first}.$format";

    File file;

    if (format == "jpg") {
      file = File(newPath)
        ..writeAsBytesSync(img.encodeJpg(image!));
    } else if (format == "png") {
      file = File(newPath)
        ..writeAsBytesSync(img.encodePng(image!));
    } else {
      file = File(newPath)
        ..writeAsBytesSync(img.encodeWebp(image!));
    }

    await page.close();
    await document.close();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("File converted to $format\nSaved at:\n$newPath"),
      ),
    );
  }

  // ===============================
  // UI
  // ===============================

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
