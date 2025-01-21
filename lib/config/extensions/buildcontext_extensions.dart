import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<void> pushFinal({
    required String route,
    bool delayed = false,
  }) async {
    Navigator.pushNamedAndRemoveUntil(this, route, (route) => false);

    if (delayed) {
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  Future<T?> pushNamed<T extends Object?>({
    required String route,
    Object? arguments,
  }) {
    return Navigator.pushNamed(
      this,
      route,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>({Object? result}) {
    Navigator.pop(
      this,
      result,
    );
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
