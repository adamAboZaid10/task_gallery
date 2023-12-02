import 'package:flutter/material.dart';

import '../../../../core/utlis/assets.dart';
import '../open_albums_screen.dart';
import 'custom_default_image.dart';
import 'custom_name_albums_widget.dart';

class CustomItemAlbumsGridView extends StatelessWidget {
  const CustomItemAlbumsGridView({Key? key, required this.name})
      : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OpenAlbumsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomDefaultImage(
                height: 160,
                width: 160,
                image: AssetsData.albumsImage,
              ),
            ),
            CustomNameAlbumsWidget(text: name),
          ],
        ),
      ),
    );
  }
}
