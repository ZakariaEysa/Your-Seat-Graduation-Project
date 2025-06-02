import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_state.dart';

class CinemaItemCubit extends Cubit<CinemaItemState> {
  CinemaItemCubit() : super(CinemaLoading());
  static CinemaItemCubit get(context) =>
      BlocProvider.of<CinemaItemCubit>(context);

  var cinemas;
  void fetchCinemas() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('Cinemas').get();
      cinemas = snapshot.docs;
      emit(CinemaSuccess(snapshot.docs));
    } catch (e) {
      emit(CinemaFailure(e.toString()));
    }
  }
}
