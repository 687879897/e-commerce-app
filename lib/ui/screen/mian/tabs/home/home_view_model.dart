import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/cartrepo/cart-repo.dart';
import '../../../../../data/mainrepo/main-repo.dart';
import '../../../../../data/watchlistrepo/watchlist-repo.dart';
import '../../../../../model/cart-response.dart';
import '../../../../../model/catogry-response.dart';
import '../../../../../model/get-product-response.dart';
import '../../../../../model/prouductresponse.dart';
import '../../../../../model/watchlist-response.dart';
import '../../../../base/enums/base-screen-state.dart';
import 'home-state.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final MainRepo mainRepo;
  final CartRepo cartRepo;
  WatchListRepo watchlistrepo;



  HomeViewModel(this.mainRepo, this.cartRepo,this.watchlistrepo) : super(HomeState()){
    listentoChanges();
    listentoChangesinwatchlist();
  }

  Future<void> loadCategory() async {
    emit(state.copyWith(catogrystate: BaseScreenState.loading));
    try {
      List<CatogryDM> category = await mainRepo.getallcatogry();
      emit(state.copyWith(
          catogry: category, catogrystate: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          catogry: null,
          catogrystate: BaseScreenState.failuer,
          categoryErrorMessage: e.toString()));
    }
  }

  Future<void> loadProduct() async {
    emit(state.copyWith(productstate: BaseScreenState.loading));
    try {
      List<ProductDM> product = await mainRepo.getProduct();
      emit(state.copyWith(
          product: product, productstate: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          product: null,
          productstate: BaseScreenState.failuer,
          productErrorMessage: e.toString()));
    }
  }

  Future<void> saveProduct(Products product) async {
    try {
      await FirebaseFirestore.instance.collection('favorites').add(product.toJson());
      emit(state.copyWith(productstate: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          productstate: BaseScreenState.failuer,
          productErrorMessage: e.toString()));
    }
  }
  listentoChanges(){
    cartRepo.getstream().listen((cartdm) {
      emit(state.copyWith(cartDm: cartdm));
    });
  }
 bool isinCart(String produectid){
    for(CartProduectDeatils cart in state.cartDm?.products??[]){
      if(produectid==cart.product?.id){

        return true;
      }
    }

    return false;
  }

  void refreashcart() {
    cartRepo.getcart();
  }
  void removeproductfromcart(String id){

    cartRepo.removefromcart(id);
  }
  void addproducttocart(String id){
    cartRepo.addtocart(id);
  }
  listentoChangesinwatchlist(){
    watchlistrepo.getstream().listen((watchlist) {
      emit(state.copyWith(watchList:watchlist));
    });
  }
  bool isinwatchlist(String produectid){
    for(WatchListDm product in state.watchList??[]){
      if(produectid==product.id){
        print("product id is submit:$produectid");
        print("product id is orignal:${product.id}");

        return true;
      }
    }

    return false;
  }

  void refreashwatchlist() {
    watchlistrepo.getwatchlist();
    print("${state.watchList}");
  }
  void removeproductfromwatchlist(String id){

    watchlistrepo.removefromwatchlist(id);
  }
  void addproducttowatchlist(String id){
    watchlistrepo.addtowatchlist(id);
    print("product id is submit:$id");
  }
}
