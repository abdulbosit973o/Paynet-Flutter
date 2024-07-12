part of 'all_card_bloc.dart';

class AllCardState {
  final List<CardModel>? cardList;
  final String? errorMessage;
  final Status status;

  AllCardState({this.errorMessage, required this.status, this.cardList});

  AllCardState copyWith({
    final List<CardModel>? cardList,
    final String? errorMessage,
    final Status? status,
  }) =>
      AllCardState(status: status ?? this.status, cardList: cardList ?? this.cardList, errorMessage: errorMessage ?? this.errorMessage);
}
