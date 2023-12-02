import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/cubit/cubit_albums_cubit.dart';
import 'custom_items_albums_gridview.dart';

class Albums_Screen_body extends StatelessWidget {
  const Albums_Screen_body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitAlbumsCubit, AlbumState>(
      builder: (context, state) {
        var cubit = CubitAlbumsCubit.get(context);
        if (state is SuccessPhotosInAlbumState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1 / 1.19,
                  crossAxisSpacing: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(cubit.albums.length, (index) {
                    final albums = cubit.albums[index];
                    return CustomItemAlbumsGridView(
                      name: albums.name,
                    );
                  }),
                ),
              ],
            ),
          );
        } else if (state is ErrorLoadedPhotosInAlbumState) {
          return const Center(
            child: Text('error in this albums'),
          );
        } else if (state is LoadingPhotosInAlbumState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('other'),
          );
        }
      },
    );
  }
}
