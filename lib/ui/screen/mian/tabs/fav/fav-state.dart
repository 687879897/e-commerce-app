import 'package:e_commerce_friday_c9/model/cart-response.dart';

import '../../../../../model/watchlist-response.dart';

class FavState {

  final List<WatchListDm>? watchList;

  FavState({

    this.watchList,
  });

  FavState copyWith({

    List<WatchListDm>? watchList,
  }) {
    return FavState(

        watchList:watchList ??this.watchList
    );
  }
}