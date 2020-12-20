import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voli/util/permissions.dart';

class ImageUtils {
  static const _platform =
      const MethodChannel('dev.idkwuu.allesandroid/storage');

  Future<bool> saveImage(BuildContext context, Uint8List imageBytes) async {
    if (Platform.isAndroid) {
      bool shouldSave = true;
      if (await _platform.invokeMethod("androidVersion"))
        shouldSave = await askForStoragePermission(context);

      if (shouldSave) {
        try {
          return await _platform
              .invokeMethod("saveImage", {"bitmap": imageBytes});
        } on PlatformException {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<Uint8List> loadImage(String url) async {
    HttpClient httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var image = await request.close();
    return await consolidateHttpClientResponseBytes(image);
  }
}
