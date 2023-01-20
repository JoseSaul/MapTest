import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView(this.title, this.message, {Key? key}) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.cyan,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ));
    //SizedBox( height: 50, child: Text(message));
  }
}
