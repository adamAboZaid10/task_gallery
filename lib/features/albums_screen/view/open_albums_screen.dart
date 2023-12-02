import 'package:flutter/material.dart';
import 'package:test_gallery_app/features/albums_screen/view/widgets/open_albums_screen_body.dart';

class OpenAlbumsScreen extends StatelessWidget {
  const OpenAlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text('Recent'),
      ),
      body: const OpenAlbumsScreenBody(),
    );
  }
}
