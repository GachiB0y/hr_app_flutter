import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ShowAction {
  /// Вызов [CupertinoActionSheet]
  static Future<dynamic> cupertinoActionSheet({
    required BuildContext context,
    required Widget child,
  }) async {
    return await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => child,
    );
  }
}
