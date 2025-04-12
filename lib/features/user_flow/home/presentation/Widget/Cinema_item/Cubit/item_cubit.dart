import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'item_state.dart';

class CinemaaItemCubit extends Cubit<CinemaaItemState> {
  CinemaaItemCubit() : super(CinemaLoading()); // ✅ إصلاح التهيئة
  static CinemaaItemCubit get(context) => BlocProvider.of<CinemaaItemCubit>(context);

  var cinemas;
  void fetchCinemas() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('Cinemas').get();
      cinemas=snapshot.docs;
      emit(CinemaSuccess(snapshot.docs));
    } catch (e) {
      emit(CinemaFailure(e.toString()));
    }
  }
}
