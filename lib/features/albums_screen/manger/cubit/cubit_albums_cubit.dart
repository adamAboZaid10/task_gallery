import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

part 'cubit_albums_state.dart';

class CubitAlbumsCubit extends Cubit<AlbumState> {
  CubitAlbumsCubit() : super(InitialAlbumState());
  static CubitAlbumsCubit get(BuildContext? context) =>
      BlocProvider.of(context!);

  List<AssetPathEntity> albums = [];
  List<AssetEntity> allMedia = [];

  Future<void> loadAlbums() async {
    emit(LoadingAlbumState());
    albums = await PhotoManager.getAssetPathList();

    await getAllPhotos(result: albums).then((value) {
      allMedia = value;
      emit(SuccessPhotosInAlbumState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ErrorLoadedPhotosInAlbumState());
    });

    // albums[0].getAssetListPaged(page: 1, size: 100);
  }

  List<AssetEntity> media = [];

  Future<List<AssetEntity>> getAllPhotos({
    required List<AssetPathEntity> result,
  }) async {
    emit(LoadingPhotosInAlbumState());
    try {
      media = await result[0].getAssetListPaged(page: 1, size: 100);
    } catch (error) {
      debugPrint(error.toString());
    }
    return media;
  }
}

// getMedia(GetMediaEvent event, Emitter<UploadContentState> emit) async {
//   final PermissionState ps = await PhotoManager.requestPermissionExtend();
//   if (ps.isAuth) {
//     List<AssetPathEntity> result = [];
//     List<PicInfo> allMedia = [];
//     result = await PhotoManager.getAssetPathList();
//
//     await fetchingMedia(result: result).then((value) {
//       allMedia = value;
//     }).catchError((error) {
//       debugPrint(error.toString());
//     });
//
//     emit(state.copyWith(
//       allMedia: allMedia,
//     ));
//   } else {
//     await PhotoManager.openSetting();
//   }
// }
//
//
// Future<List<PicInfo>> fetchingMedia({
//   required List<AssetPathEntity> result,
// }) async {
//   List<AssetEntity> media = [];
//   List<PicInfo> allMedia = [];
//   try {
//     media = await result[0].getAssetListPaged(
//       page: CreateContentData.currentPage,
//       size: 100,
//     );
//     if (media.isEmpty) {
//       if (CreateContentData.hasMore) {
//         CreateContentData.hasMore = false;
//       }
//     } else {
//       for (var element in media) {
//         PicInfo? picInfo;
//         File? file;
//         Uint8List? thumbnail;
//
//         try {
//           file = await element.file;
//           if (file == null || !await isFileAccessible(file.path)) {
//             continue;
//           }
//
//           // Check if the file is a HEIC OR HEIF file
//           if (file.path.toLowerCase().endsWith('.heic') ||
//               file.path.toLowerCase().endsWith('.heif')) {
//             final tmpDir = (await getTemporaryDirectory()).path;
//             final target =
//                 '$tmpDir/${DateTime.now().millisecondsSinceEpoch}.jpg';
//             final result = await FlutterImageCompress.compressAndGetFile(
//               file.path,
//               target,
//             );
//             CreateContentData.heicCache.add(target);
//             file = File(result!.path);
//             thumbnail = await fileToUint8List(result.path);
//           } else {
//             thumbnail = await element.thumbnailData;
//           }
//         } catch (e) {
//           debugPrint("Error fetching file or thumbnail: $e");
//           continue;
//         }
//
//         picInfo = PicInfo(
//           id: element.id,
//           pic: element,
//           thumbnail: thumbnail,
//           filePath: file.path,
//           type: element.type,
//         );
//         allMedia.add(picInfo);
//       }
//       CreateContentData.currentPage++;
//       return allMedia;
//     }
//   } catch (e) {
//     debugPrint("Error fetching MEDIA: $e");
//   }
//   return [];
// // }
