part of 'add_card_bloc.dart';

@immutable
sealed class AddCardEvent {}
class AddCardHiveEvent extends AddCardEvent{
  final CardModel cardModel;
  AddCardHiveEvent({required this.cardModel});
}
