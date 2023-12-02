import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:test_gallery_app/features/albums_screen/manger/cubit/cubit_albums_cubit.dart';

import 'custom_default_image.dart';

class OpenAlbumsScreenBody extends StatelessWidget {
  const OpenAlbumsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitAlbumsCubit, AlbumState>(
      builder: (context, state) {
        var cubit = CubitAlbumsCubit.get(context);
        if (state is SuccessPhotosInAlbumState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: cubit.allMedia.length,
            itemBuilder: (context, index) {
              return ImageItem(cubit.allMedia[index]);
            },
          );
        } else if (state is ErrorLoadedPhotosInAlbumState) {
          return const Center(
            child: Text('there are error in this code '),
          );
        } else if (state is LoadingPhotosInAlbumState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('not found'),
          );
        }
      },
    );
  }
}

class CustomItemOpenAlbumsImage extends StatelessWidget {
  const CustomItemOpenAlbumsImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CustomDefaultImage(
      height: 70,
      width: 70,
      image: imageUrl,
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const EditImageScreen(),
        //   ),
        // );
      },
    );
  }
}

class ImageItem extends StatelessWidget {
  final AssetEntity image;

  const ImageItem(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: image.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
      builder: (context, snapshot) {
        if (snapshot.data != null &&
            snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              // Handle image tap
            },
            child: SizedBox(
                width: 200,
                height: 200,
                child: Image.memory(snapshot.data as Uint8List,
                    fit: BoxFit.cover)),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
