import 'dart:convert';
import 'package:e_commerce_friday_c9/model/brand-response.dart';
import 'package:e_commerce_friday_c9/model/prouductresponse.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../model/brandrespone.dart';
import '../../model/catogry-response.dart';
import '../../ui/utils/constants.dart';
import '../../ui/utils/end_points.dart';
import 'main-repo.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo {
  final InternetConnectionChecker internetConnectionChecker;

  MainRepoImpl(this.internetConnectionChecker);

  @override
  Future<List<CatogryDM>> getallcatogry() async {
    Uri uri = Uri.parse(EndPoints.categories);
    if (await internetConnectionChecker.hasConnection) {
      Response response = await get(uri);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        CatogryResponse catogryResponse = CatogryResponse.fromJson(jsonDecode(response.body));
        if (catogryResponse.data != null) {
          return catogryResponse.data!;
        } else {
          throw Exception(Constants.defaultErrorMessage);
        }
      } else {
        throw Exception(Constants.defaultErrorMessage);
      }
    } else {
      throw Exception(Constants.internetErrorMessage);
    }
  }

  @override
  Future<List<Products>> getprouduct() async {
    Uri uri = Uri.parse(EndPoints.products);
    try {
      if (await internetConnectionChecker.hasConnection) {
        Response response = await get(uri);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          ProudecResponse productResponse = ProudecResponse.fromJson(jsonDecode(response.body));
          if (productResponse.products != null) {
            return productResponse.products!;
          } else {
            throw Constants.defaultErrorMessage!;
          }
        } else {
          throw Constants.defaultErrorMessage!;
        }
      }
      else {
        throw Constants.internetErrorMessage!;
      }
    } catch (e) {
      print('Error in API call: $e');
      throw e; // Re-throw the error for higher level handling
    }
  }

  @override
  Future<List<Data>> getallbrand() async {
    Uri uri = Uri.parse(EndPoints.brand);
    try {
      if (await internetConnectionChecker.hasConnection) {
        Response response = await get(uri);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          BrandResponse brandResponse = BrandResponse.fromJson(jsonDecode(response.body));
          if (brandResponse.data != null) {
            return brandResponse.data!;
          } else {
            throw Constants.defaultErrorMessage!;
          }
        } else {
          throw Constants.defaultErrorMessage!;
        }
      }
      else {
        throw Constants.internetErrorMessage!;
      }
    } catch (e) {
      print('Error in API call: $e');
      throw e; // Re-throw the error for higher level handling
    }
  }

  @override
  Future<List<Dm>> getbrand() async {
    Uri uri = Uri.parse(EndPoints.specifocbrand);
    try {
      if (await internetConnectionChecker.hasConnection) {
        Response response = await get(uri);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          specificBrandResponse  brandResponse = specificBrandResponse.fromJson(jsonDecode(response.body));
          if (brandResponse.data != null) {
            return brandResponse.data!;
          } else {
            throw Constants.defaultErrorMessage!;
          }
        } else {
          throw Constants.defaultErrorMessage!;
        }
      }
      else {
        throw Constants.internetErrorMessage!;
      }
    } catch (e) {
      print('Error in API call: $e');
      throw e; // Re-throw the error for higher level handling
    }
  }
}
