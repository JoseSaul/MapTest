import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, required this.function}) : super(key: key);

  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: function(),
          child: const Text('Search'),
        )
    );
  }
}
