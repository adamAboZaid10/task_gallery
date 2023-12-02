import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:test_gallery_app/features/albums_screen/manger/cubit/cubit_albums_cubit.dart';
import 'package:test_gallery_app/features/albums_screen/view/albums_screen.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  final PermissionState ps = await PhotoManager.requestPermissionExtend();

  ps.isAuth;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitAlbumsCubit>(
            create: (context) => CubitAlbumsCubit()..loadAlbums()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AlbumsScreen(),
      ),
    );
  }
}
