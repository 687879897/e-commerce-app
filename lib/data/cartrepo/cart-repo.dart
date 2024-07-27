
import '../../model/cart-response.dart';

abstract class CartRepo{
  Future<CartDM>getcart();
  Future addtocart(String id);
  Future removefromcart(String id);
  Stream<CartDM>getstream();
}