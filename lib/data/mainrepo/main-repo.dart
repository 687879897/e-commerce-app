

import '../../model/brand-response.dart';
import '../../model/brandrespone.dart';
import '../../model/catogry-response.dart';
import '../../model/prouductresponse.dart';

abstract class MainRepo{
  Future <List<CatogryDM>> getallcatogry();
  Future<List<Products>> getprouduct();
  Future<List<Data>> getallbrand();
  Future<List<Dm>> getbrand();

}