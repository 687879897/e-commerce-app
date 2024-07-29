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

import 'data/authrepo/auth-repo-impl.dart' as _i13;
import 'data/authrepo/auth-repo.dart' as _i12;
import 'data/authrepo/authremotdatasource/auth-remot-data-source-impl.dart'
    as _i11;
import 'data/authrepo/authremotdatasource/auth-remot-data-source.dart' as _i10;
import 'data/cartrepo/cart-repo-impl.dart' as _i16;
import 'data/cartrepo/cart-repo.dart' as _i15;
import 'data/mainrepo/main-repo-impl.dart' as _i7;
import 'data/mainrepo/main-repo.dart' as _i6;
import 'third_party_packegs_modul.dart' as _i20;
import 'ui/base/base-state/base-state.dart' as _i3;
import 'ui/base/enums/base-screen-state.dart' as _i4;
import 'ui/screen/auth/login/login-view-model.dart' as _i18;
import 'ui/screen/auth/register/register-view-model.dart' as _i19;
import 'ui/screen/mian/mainviewmodel/main_view_model.dart' as _i8;
import 'ui/screen/mian/tabs/categories/categories-viewmodel.dart' as _i14;
import 'ui/screen/mian/tabs/home/home_view_model.dart' as _i17;
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
    gh.factory<_i10.AuthRemotDataSource>(
        () => _i11.AuthRemotDataSourceImpl(gh<_i9.SharedPreference>()));
    gh.factory<_i12.AuthRepo>(() => _i13.AuthRepoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i10.AuthRemotDataSource>(),
        ));
    gh.factory<_i14.Brandviewmodel>(
        () => _i14.Brandviewmodel(gh<_i6.MainRepo>()));
    gh.singleton<_i15.CartRepo>(
        () => _i16.CartRepoImpl(gh<_i9.SharedPreference>()));
    gh.factory<_i17.HomeViewModel>(() => _i17.HomeViewModel(
          gh<_i6.MainRepo>(),
          gh<_i15.CartRepo>(),
        ));
    gh.factory<_i18.LoginViewModel>(
        () => _i18.LoginViewModel(gh<_i12.AuthRepo>()));
    gh.factory<_i19.RegisterViewModel>(
        () => _i19.RegisterViewModel(gh<_i12.AuthRepo>()));
    return this;
  }
}

class _$ThirdPartyPackegsModul extends _i20.ThirdPartyPackegsModul {}
