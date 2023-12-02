import 'package:flutter/material.dart';

class CustomNameAlbumsWidget extends StatelessWidget {
  const CustomNameAlbumsWidget({Key? key, required this.text})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    );
  }
}
