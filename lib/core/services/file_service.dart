// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
//
// class FileService {
//
//   /// Pick file and return file name + content
//   static Future<Map<String, String>?> pickFile() async {
//     try {
//       FilePickerResult? result =
//       await FilePicker.platform.pickFiles();
//
//       if (result != null) {
//         final file = result.files.first;
//         final path = file.path;
//
//         if (path != null) {
//           final content = await File(path).readAsString();
//
//           return {
//             "fileName": file.name,
//             "content": content,
//           };
//         }
//       }
//     } catch (e) {
//       print("FileService Error: $e");
//     }
//
//     return null;
//   }
// }


// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
//
// class PickedFileData {
//   final String fileName;
//   final String content;
//
//   PickedFileData({
//     required this.fileName,
//     required this.content,
//   });
// }
//
// class FileService {
//   /// Pick file and return file name + content
//   static Future<PickedFileData?> pickFile() async {
//     try {
//       FilePickerResult? result =
//       await FilePicker.platform.pickFiles();
//
//       if (result != null) {
//         final file = result.files.first;
//         final path = file.path;
//
//         if (path != null) {
//           final content = await File(path).readAsString();
//
//           return PickedFileData(
//             fileName: file.name,
//             content: content,
//           );
//         }
//       }
//     } catch (e) {
//       print("FileService Error: $e");
//     }
//
//     return null;
//   }
// }


import 'package:file_picker/file_picker.dart';

class PickedFileData {
  final String name;
  final String path;
  final int size;

  PickedFileData({
    required this.name,
    required this.path,
    required this.size,
  });
}

class FileService {
  static Future<PickedFileData?> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result == null || result.files.isEmpty) {
        return null;
      }

      final file = result.files.first;

      return PickedFileData(
        name: file.name,
        path: file.path ?? "",
        size: file.size,
      );
    } catch (e) {
      return null;
    }
  }
}
