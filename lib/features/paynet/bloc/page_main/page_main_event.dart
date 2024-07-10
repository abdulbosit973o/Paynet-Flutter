part of 'page_main_bloc.dart';

@immutable
sealed class PageMainEvent {}

class LoadMainScreenEvent extends PageMainEvent{}