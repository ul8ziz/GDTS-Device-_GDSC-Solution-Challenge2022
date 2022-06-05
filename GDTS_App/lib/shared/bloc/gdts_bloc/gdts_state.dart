part of 'gdts_cubit.dart';

@immutable
abstract class GdtsState {}

class GdtsInitial extends GdtsState {}

class GdtsChangeButtonNavState extends GdtsState {}
//getUsersDate
class  GdtsLoadingStates extends GdtsState {}

class  GdtsSuccessStates extends GdtsState {}

class  GdtsErorrStates extends GdtsState {}
//get All user Chat
class  GdtsUserLoadingStates extends GdtsState {}

class  GdtsUserSuccessStates extends GdtsState {}

class  GdtsUserErorrStates extends GdtsState {}

//Upload Image Profile
class GdtsProfileImageSuccessState extends GdtsState {}

class GdtsProfileImageErorrState extends GdtsState {}

class GdtsUploadProfileImageSuccessState extends GdtsState {}

class GdtsUploadProfileImageErorrState extends GdtsState {}
//upload Image cover
class GdtsCoverImageSuccessState extends GdtsState {}

class GdtsCoverImageErorrState extends GdtsState {}

class GdtsUploadCoverImageSuccessState extends GdtsState {}

class GdtsUploadCoverImageErorrState extends GdtsState {}
//Update User
class GdtsUpdateLoadingStates extends GdtsState {}