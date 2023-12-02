import 'package:flutter/material.dart';
import 'package:test_gallery_app/features/albums_screen/view/widgets/albums_screen_body.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Albums',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: const Albums_Screen_body(),
    );
  }
}
