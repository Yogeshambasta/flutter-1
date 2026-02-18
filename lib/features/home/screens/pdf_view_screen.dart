// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';
// import 'package:image/image.dart' as img;
// import 'package:path_provider/path_provider.dart';
//
// class PdfViewScreen extends StatefulWidget {
//   final String path;
//   final String name;
//
//   const PdfViewScreen({
//     super.key,
//     required this.path,
//     required this.name,
//   });
//
//   @override
//   State<PdfViewScreen> createState() => _PdfViewScreenState();
// }
//
// class _PdfViewScreenState extends State<PdfViewScreen> {
//
//   late PdfControllerPinch _controller;
//
//   /// Selected format (FIXED PROPERLY)
//   String _selectedFormat = "jpg";
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PdfControllerPinch(
//       document: PdfDocument.openFile(widget.path),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//
//   // CONVERT DIALOG
//
//
//   void _showConvertDialog() {
//     String selectedFormat = _selectedFormat;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setStateDialog) {
//             return AlertDialog(
//               title: const Text("Convert Options"),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//
//                   RadioListTile<String>(
//                     title: const Text("JPG"),
//                     value: "jpg",
//                     groupValue: selectedFormat,
//                     onChanged: (value) {
//                       setStateDialog(() {
//                         selectedFormat = value!;
//                       });
//                     },
//                   ),
//
//                   RadioListTile<String>(
//                     title: const Text("PNG"),
//                     value: "png",
//                     groupValue: selectedFormat,
//                     onChanged: (value) {
//                       setStateDialog(() {
//                         selectedFormat = value!;
//                       });
//                     },
//                   ),
//
//                   RadioListTile<String>(
//                     title: const Text("WEBP"),
//                     value: "webp",
//                     groupValue: selectedFormat,
//                     onChanged: (value) {
//                       setStateDialog(() {
//                         selectedFormat = value!;
//                       });
//                     },
//                   ),
//
//                   RadioListTile<String>(
//                     title: const Text("EPS"),
//                     value: "eps",
//                     groupValue: selectedFormat,
//                     onChanged: (value) {
//                       setStateDialog(() {
//                         selectedFormat = value!;
//                       });
//                     },
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   ElevatedButton(
//                     onPressed: () async {
//                       _selectedFormat = selectedFormat; // save final selection
//                       Navigator.pop(context);
//                       await _convertFile(_selectedFormat);
//                     },
//                     child: const Text("CONVERT"),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//
//
//   // CONVERT LOGIC
//
//
//   Future<void> _convertFile(String format) async {
//
//     if (format == "eps") {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("EPS conversion not supported locally."),
//         ),
//       );
//       return;
//     }
//
//     final document = await PdfDocument.openFile(widget.path);
//     final page = await document.getPage(1);
//
//     final pageImage = await page.render(
//       width: page.width,
//       height: page.height,
//       format: PdfPageImageFormat.png,
//     );
//
//     if (pageImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Failed to render PDF page")),
//       );
//       return;
//     }
//
//     final image = img.decodeImage(pageImage.bytes);
//
//     if (image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Image decoding failed")),
//       );
//       return;
//     }
//
//     final directory = await getApplicationDocumentsDirectory();
//     final baseName = widget.name.split('.').first;
//     final newPath = "${directory.path}/$baseName.$format";
//
//     List<int> encodedBytes;
//
//     if (format == "jpg") {
//       encodedBytes = img.encodeJpg(image);
//     }
//     else if (format == "png") {
//       encodedBytes = img.encodePng(image);
//     }
//     else if (format == "webp") {
//       // Safe WebP fallback
//       encodedBytes = img.encodePng(image);
//     }
//     else {
//       encodedBytes = img.encodePng(image);
//     }
//
//     final file = File(newPath);
//     await file.writeAsBytes(encodedBytes);
//
//     await page.close();
//     await document.close();
//
//     if (!mounted) return;
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("File converted to $format\nSaved at:\n$newPath"),
//       ),
//     );
//   }
//
//
//   // UI
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Print feature coming soon")),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.save_alt),
//             onPressed: _showConvertDialog,
//           ),
//         ],
//       ),
//       body: PdfViewPinch(
//         controller: _controller,
//       ),
//     );
//   }
// }

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


  // CONVERT DIALOG (GRID STYLE)


  void _showConvertDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "Convert Options",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                      children: [
                        _buildFormatBox(
                            "JPG", "jpg", Colors.blue, setStateDialog),
                        _buildFormatBox(
                            "PNG", "png", Colors.green, setStateDialog),
                        _buildFormatBox(
                            "WEBP", "webp", Colors.teal, setStateDialog),
                        _buildFormatBox("TIFF", "tiff", Colors.orange, setStateDialog),

                      ],
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await _convertFile(_selectedFormat);
                        },
                        child: const Text(
                          "CONVERT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFormatBox(
      String title,
      String value,
      Color color,
      Function setStateDialog,
      ) {
    final isSelected = _selectedFormat == value;

    return GestureDetector(
      onTap: () {
        setStateDialog(() {
          _selectedFormat = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: color.withOpacity(0.2),
                    child: Icon(
                      Icons.insert_drive_file,
                      color: color,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }


  // CONVERT LOGIC


  Future<void> _convertFile(String format) async {
    if (format == "pdf") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Already in PDF format")),
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

    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image conversion failed")),
      );
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    final newPath =
        "${directory.path}/${widget.name.split('.').first}.$format";

    List<int> encodedBytes;

    if (format == "jpg") {
      encodedBytes = img.encodeJpg(image);
    }
    else if (format == "png") {
      encodedBytes = img.encodePng(image);
    }
    else if (format == "webp") {
      encodedBytes = img.encodePng(image);
    }
    else if (format == "tiff") {
      encodedBytes = img.encodeTiff(image);
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
