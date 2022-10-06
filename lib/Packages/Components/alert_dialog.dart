import 'package:flutter/material.dart';

class AlertDialogCustom extends StatefulWidget {
  const AlertDialogCustom({Key? key}) : super(key: key);

  @override
  State<AlertDialogCustom> createState() => _AlertDialogCustomState();
}

class _AlertDialogCustomState extends State<AlertDialogCustom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(Icons.ac_unit_outlined),
              title: const Text('AlertDialog Title'),
              content: const Text('AlertDialog description'),
              contentTextStyle: const TextStyle(color: Colors.amber),
              actionsAlignment: MainAxisAlignment.end,
              elevation: 50,
              actionsOverflowButtonSpacing: 100,
              actionsOverflowAlignment: OverflowBarAlignment.end,
              alignment: Alignment.topCenter,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              scrollable: true,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Text('Open Alert Dialog'),
      ),
    );
  }
}
