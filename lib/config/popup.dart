import 'package:flutter/material.dart';

showConfimation(
    {required BuildContext context,
    required String message,
    required Function onTapYes,
    Function? onTapNo,
    String labelYes = "SIM",
    String labelNo = "NÃO",
    bool isDismissible = false}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: isDismissible,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "CONFIRMAÇÃO !",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(message),
              Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onTapYes();
                      Navigator.pop(context);
                    },
                    child: Text(labelYes.toUpperCase()),
                  ),
                  TextButton(
                    onPressed: () {
                      if (onTapNo != null) {
                        onTapNo();
                      }

                      Navigator.pop(context);
                    },
                    child: Text(labelNo.toUpperCase()),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
