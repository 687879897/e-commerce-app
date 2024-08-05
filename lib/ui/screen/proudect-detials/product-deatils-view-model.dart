import 'package:e_commerce_friday_c9/ui/screen/proudect-detials/product-details-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/cartrepo/cart-repo.dart';
import '../../../model/cart-response.dart';
@injectable
class ProductDateilsViewModel extends Cubit<ProductDateilsState> {
  CartRepo cartRepo;

  ProductDateilsViewModel(this.cartRepo) : super(ProductDateilsState()){
    listentoChanges();
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
    print("${state.cartDm?.products}");
  }
  void removeproductfromcart(String id){

    cartRepo.removefromcart(id);
  }
  void addproducttocart(String id){
    cartRepo.addtocart(id);
  }
  void updatecount(String id,int count){
    print("count: $count");
    cartRepo.updatecart(id, count);
  }
}
