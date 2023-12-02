// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stadio_app_flutter/core/utlis/assets.dart';
// import 'package:stadio_app_flutter/features/albums_screen/manger/cubit/cubit_albums_cubit.dart';
//
// class EditImageScreen extends StatelessWidget {
//   const EditImageScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => CubitAlbumsCubit(),
//       child: BlocConsumer<CubitAlbumsCubit, CubitAlbumsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var cubit = CubitAlbumsCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                 ),
//               ),
//               title: const Text('Recent'),
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0, right: 10),
//                     child: Container(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * .8,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: cubit.selectedImage == null
//                           ? Image.asset(AssetsData.albumsImage)
//                           : Image.file(
//                               cubit.selectedImage!,
//                               fit: BoxFit.cover,
//                             ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       cubit.getGalleryImage();
//                     },
//                     child: const Text(
//                       'picked',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
