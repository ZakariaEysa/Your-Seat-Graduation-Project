import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class CinemaaItemState extends Equatable {
  @override
  List<Object> get props => [];
}

class CinemaLoading extends CinemaaItemState {}

class CinemaSuccess extends CinemaaItemState {
  final List<QueryDocumentSnapshot> cinemas;

  CinemaSuccess(this.cinemas);

  @override
  List<Object> get props => [cinemas];
}

class CinemaFailure extends CinemaaItemState {
  final String error;

  CinemaFailure(this.error);

  @override
  List<Object> get props => [error];
}
