import 'package:boilerplate/data/repositories/user/i_user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../di/components/injection.dart';
import '../../sharedpref/shared_preference_helper.dart';

@Environment(Env.dev)
@Injectable(as: IUserRepository)
class DevUserRepository implements IUserRepository  {

  // shared pref object
  SharedPreferenceHelper _sharedPrefsHelper;

  DevUserRepository(this._sharedPrefsHelper);

  @override
  Future<bool> login(String email, String password) async => await Future.delayed(Duration(seconds: 2), ()=> true);
  @override
  Future<void> saveIsLoggedIn(bool value) async =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
  
}