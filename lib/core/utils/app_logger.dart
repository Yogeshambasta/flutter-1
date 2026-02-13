// import 'package:flutter/foundation.dart';
//
// class AppLogger {
//
//   AppLogger._();
//
//   static void log(dynamic message) {
//     if (kDebugMode) {
//       print(" DEBUG: $message");
//     }
//   }
//
// }


import 'package:flutter/foundation.dart';


class AppLogger {

  AppLogger._();

  /// Basic log
  static void log(
      dynamic message, {
        String? tag,
      }) {
    if (kDebugMode) {
      final String logTag = tag ?? "APP_LOG";
      debugPrint("[$logTag] $message");
    }
  }

  /// Info log
  static void info(dynamic message) {
    if (kDebugMode) {
      debugPrint(" INFO: $message");
    }
  }

  /// Warning log
  static void warning(dynamic message) {
    if (kDebugMode) {
      debugPrint(" WARNING: $message");
    }
  }

  /// Error log
  static void error(
      dynamic message, {
        Object? error,
        StackTrace? stackTrace,
      }) {
    if (kDebugMode) {
      debugPrint(" ERROR: $message");

      if (error != null) {
        debugPrint("Error Details: $error");
      }

      if (stackTrace != null) {
        debugPrint("StackTrace: $stackTrace");
      }
    }
  }

}
