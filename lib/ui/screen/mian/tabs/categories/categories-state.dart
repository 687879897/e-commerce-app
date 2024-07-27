import '../../../../../model/brand-response.dart';

import '../../../../../model/brandrespone.dart';
import '../../../../base/enums/base-screen-state.dart';
import '../../../../utils/app_assets.dart';

class BrandState {
  static const List<String> defaultAds = [AppAssets.ads, AppAssets.ads, AppAssets.ads];
  final List<String> ads;
  final BaseScreenState brandState;
  final List<Data>? brandData;
  final String brandErrorMessage;
  final List<Dm>? onebrand;

  BrandState({
    this.ads = defaultAds,
    this.brandData,
    this.brandState = BaseScreenState.loading,
    this.brandErrorMessage = '',
    this.onebrand,
  });

  BrandState copyWith({
    List<String>? ads,
    BaseScreenState? brandState,
    List<Data>? brandData,
    String? brandErrorMessage,
    List<Dm>? onebrand,

  }) {
    return BrandState(
      ads: ads ?? this.ads,
      brandState: brandState ?? this.brandState,
      brandData: brandData ?? this.brandData,
      brandErrorMessage: brandErrorMessage ?? this.brandErrorMessage,
      onebrand: onebrand ?? this.onebrand,

    );
  }
}
