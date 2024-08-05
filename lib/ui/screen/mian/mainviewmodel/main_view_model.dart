import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../model/prouductresponse.dart';
import 'main-view-model-state.dart';

@injectable
class MainViewModel extends Cubit<MainScreenState> {
  MainViewModel() : super(MainScreenState());


  void setcurrenttabindex(int newindex) {
    emit(state.copyWith(currentTabIndex: newindex));
  }
  Future<ProudecResponse> getProduct() async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("fav");
    DocumentSnapshot documentSnapshot =
    await collectionReference.doc().get();
    Map<String,dynamic> json = documentSnapshot.data() as Map<String,dynamic>;
    return ProudecResponse.fromJson(json);
  }



}
