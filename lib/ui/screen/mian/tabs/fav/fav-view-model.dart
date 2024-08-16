import 'package:e_commerce_friday_c9/data/watchlistrepo/watchlist-repo.dart';
import 'package:e_commerce_friday_c9/model/watchlist-response.dart';
import 'package:e_commerce_friday_c9/ui/screen/mian/tabs/fav/fav-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/cartrepo/cart-repo.dart';


@injectable
class FavViewModel extends Cubit<FavState> {
  WatchListRepo watchlistrepo;
  CartRepo cartRepo;

  FavViewModel(this.watchlistrepo,this.cartRepo) : super(FavState()){
    listentoChangesinwatchlist();
  }
  listentoChangesinwatchlist(){
    watchlistrepo.getstream().listen((watchlist) {
      emit(state.copyWith(watchList:watchlist));
    });
  }
  bool isinwatchlist(String produectid){
    for(WatchListDm product in state.watchList??[]){
      if(produectid==product.id){

        return true;
      }
    }

    return false;
  }

  void refreashwatchlist() {
    watchlistrepo.getwatchlist();
  }
  void removeproductfromwatchlist(String id){

    watchlistrepo.removefromwatchlist(id);
  }
  void addproducttowatchlist(String id){
    watchlistrepo.addtowatchlist(id);
  }
  void addproducttocart(String id){
    cartRepo.addtocart(id);
  }

}