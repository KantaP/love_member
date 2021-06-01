// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sembast/sembast.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../data/local/datasources/post/post_datasource.dart' as _i19;
import '../../data/network/apis/posts/post_api.dart' as _i20;
import '../../data/network/dio_client.dart' as _i24;
import '../../data/network/rest_client.dart' as _i23;
import '../../data/repositories/lang/lang_repository.dart' as _i14;
import '../../data/repositories/post/dev_post_repository.dart' as _i18;
import '../../data/repositories/post/i_post_repository.dart' as _i17;
import '../../data/repositories/post/prod_post_repository.dart' as _i21;
import '../../data/repositories/theme/theme_repository.dart' as _i7;
import '../../data/repositories/user/dev_user_repository.dart' as _i13;
import '../../data/repositories/user/i_user_repository.dart' as _i11;
import '../../data/repositories/user/prod_user_repository.dart' as _i12;
import '../../data/sharedpref/shared_preference_helper.dart' as _i8;
import '../../stores/error/error_store.dart' as _i4;
import '../../stores/form/form_store.dart' as _i5;
import '../../stores/language/language_store.dart' as _i15;
import '../../stores/post/post_store.dart' as _i22;
import '../../stores/theme/theme_store.dart' as _i9;
import '../../stores/user/user_store.dart' as _i16;
import '../module/local_module.dart' as _i25;
import '../module/network_module.dart' as _i26;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localModule = _$LocalModule();
  final networkModule = _$NetworkModule();
  await gh.factoryAsync<_i3.Database>(() => localModule.provideDatabase(),
      preResolve: true);
  gh.factory<_i4.ErrorStore>(() => _i4.ErrorStore());
  gh.factory<_i5.FormStore>(() => _i5.FormStore());
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.factory<_i7.ThemeRepository>(
      () => _i7.ThemeRepository(get<_i8.SharedPreferenceHelper>()));
  gh.factory<_i9.ThemeStore>(() => _i9.ThemeStore(get<_i7.ThemeRepository>()));
  gh.factory<_i10.Dio>(
      () => networkModule.provideDio(get<_i8.SharedPreferenceHelper>()));
  gh.factory<_i11.IUserRepository>(
      () => _i12.ProdUserRepository(get<_i8.SharedPreferenceHelper>()),
      registerFor: {_prod});
  gh.factory<_i11.IUserRepository>(
      () => _i13.DevUserRepository(get<_i8.SharedPreferenceHelper>()),
      registerFor: {_dev});
  gh.factory<_i14.LangRepository>(
      () => _i14.LangRepository(get<_i8.SharedPreferenceHelper>()));
  gh.factory<_i15.LanguageStore>(
      () => _i15.LanguageStore(get<_i14.LangRepository>()));
  gh.factory<_i16.UserStore>(() => _i16.UserStore(get<_i11.IUserRepository>()));
  gh.factory<_i17.IPostRepository>(
      () => _i18.DevPostRepository(
          get<_i19.PostDataSource>(), get<_i20.PostApi>()),
      registerFor: {_dev});
  gh.factory<_i17.IPostRepository>(
      () => _i21.ProdPostRepository(
          get<_i19.PostDataSource>(), get<_i20.PostApi>()),
      registerFor: {_prod});
  gh.factory<_i22.PostStore>(() => _i22.PostStore(get<_i17.IPostRepository>()));
  gh.singleton<_i19.PostDataSource>(_i19.PostDataSource(get<_i3.Database>()));
  gh.singleton<_i23.RestClient>(_i23.RestClient());
  gh.singleton<_i8.SharedPreferenceHelper>(
      _i8.SharedPreferenceHelper(get<_i6.SharedPreferences>()));
  gh.singleton<_i24.DioClient>(_i24.DioClient(get<_i10.Dio>()));
  gh.singleton<_i20.PostApi>(
      _i20.PostApi(get<_i24.DioClient>(), get<_i23.RestClient>()));
  return get;
}

class _$LocalModule extends _i25.LocalModule {}

class _$NetworkModule extends _i26.NetworkModule {}
