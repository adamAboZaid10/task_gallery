part of 'cubit_albums_cubit.dart';

abstract class AlbumState {}

class InitialAlbumState extends AlbumState {}

class ErrorAlbumState extends AlbumState {}

class LoadingAlbumState extends AlbumState {}

class SuccessAlbumsState extends AlbumState {
  final List<AssetPathEntity> albums;

  SuccessAlbumsState(this.albums);
}

class SuccessPhotosInAlbumState extends AlbumState {}

class LoadingPhotosInAlbumState extends AlbumState {}

class ErrorLoadedPhotosInAlbumState extends AlbumState {}
