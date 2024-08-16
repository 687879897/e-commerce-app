// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'data/authrepo/auth-repo-impl.dart' as _i15;
import 'data/authrepo/auth-repo.dart' as _i14;
import 'data/authrepo/authremotdatasource/auth-remot-data-source-impl.dart'
    as _i13;
import 'data/authrepo/authremotdatasource/auth-remot-data-source.dart' as _i12;
import 'data/cartrepo/cart-repo-impl.dart' as _i18;
import 'data/cartrepo/cart-repo.dart' as _i17;
import 'data/mainrepo/main-repo-impl.dart' as _i7;
import 'data/mainrepo/main-repo.dart' as _i6;
import 'data/watchlistrepo/watchlist-repo-impl.dart' as _i11;
import 'data/watchlistrepo/watchlist-repo.dart' as _i10;
import 'third_party_packegs_modul.dart' as _i25;
import 'ui/base/base-state/base-state.dart' as _i3;
import 'ui/base/enums/base-screen-state.dart' as _i4;
import 'ui/screen/auth/login/login-view-model.dart' as _i22;
import 'ui/screen/auth/register/register-view-model.dart' as _i24;
import 'ui/screen/cartscreen/cart-view-model.dart' as _i19;
import 'ui/screen/mian/mainviewmodel/main_view_model.dart' as _i8;
import 'ui/screen/mian/tabs/categories/categories-viewmodel.dart' as _i16;
import 'ui/screen/mian/tabs/fav/fav-view-model.dart' as _i20;
import 'ui/screen/mian/tabs/home/home_view_model.dart' as _i21;
import 'ui/screen/proudect-detials/product-deatils-view-model.dart' as _i23;
import 'utilis/sherd-perfrance/sherd-prefrance.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyPackegsModul = _$ThirdPartyPackegsModul();
    gh.factory<_i3.BaseState>(() => _i3.BaseState(
          errormassege: gh<String>(),
          state: gh<_i4.BaseScreenState>(),
        ));
    gh.factory<_i5.InternetConnectionChecker>(
        () => thirdPartyPackegsModul.ProvideInternetConnectionChecker);
    gh.factory<_i6.MainRepo>(
        () => _i7.MainRepoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.factory<_i8.MainViewModel>(() => _i8.MainViewModel());
    gh.singleton<_i9.SharedPreference>(() => _i9.SharedPreference());
    gh.singleton<_i10.WatchListRepo>(
        () => _i11.WatchListRepoImpl(gh<_i9.SharedPreference>()));
    gh.factory<_i12.AuthRemotDataSource>(
        () => _i13.AuthRemotDataSourceImpl(gh<_i9.SharedPreference>()));
    gh.factory<_i14.AuthRepo>(() => _i15.AuthRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i12.AuthRemotDataSource>(),
        ));
    gh.factory<_i16.Brandviewmodel>(
        () => _i16.Brandviewmodel(gh<_i6.MainRepo>()));
    gh.singleton<_i17.CartRepo>(
        () => _i18.CartRepoImpl(gh<_i9.SharedPreference>()));
    gh.factory<_i19.CartViewModel>(
        () => _i19.CartViewModel(gh<_i17.CartRepo>()));
    gh.factory<_i20.FavViewModel>(() => _i20.FavViewModel(
          gh<_i10.WatchListRepo>(),
          gh<_i17.CartRepo>(),
        ));
    gh.factory<_i21.HomeViewModel>(() => _i21.HomeViewModel(
          gh<_i6.MainRepo>(),
          gh<_i17.CartRepo>(),
          gh<_i10.WatchListRepo>(),
        ));
    gh.factory<_i22.LoginViewModel>(
        () => _i22.LoginViewModel(gh<_i14.AuthRepo>()));
    gh.factory<_i23.ProductDateilsViewModel>(
        () => _i23.ProductDateilsViewModel(gh<_i17.CartRepo>()));
    gh.factory<_i24.RegisterViewModel>(
        () => _i24.RegisterViewModel(gh<_i14.AuthRepo>()));
    return this;
  }
}

class _$ThirdPartyPackegsModul extends _i25.ThirdPartyPackegsModul {}
