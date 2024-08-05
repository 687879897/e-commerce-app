
import '../../model/cart-response.dart';

abstract class CartRepo{
  Future<CartDm>getcart();
  Future addtocart(String id);
  Future removefromcart(String id);
  Stream<CartDm>getstream();
  Future updatecart(String id,int cuont);

}