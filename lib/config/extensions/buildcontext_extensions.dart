import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void pushFinal({required Widget page}) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<T?> pushNamed<T extends Object?>(
      {required String page, Object? arguments}) {
    return Navigator.pushNamed(
      this,
      page,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }

  void showErro({required String mensagem}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
        elevation: 1,
      ),
    );
  }

  void showSucesso({required String mensagem}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.green,
        elevation: 1,
      ),
    );
  }
}
