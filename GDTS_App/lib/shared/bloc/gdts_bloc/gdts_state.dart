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