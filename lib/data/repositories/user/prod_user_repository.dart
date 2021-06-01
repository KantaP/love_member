import 'package:boilerplate/data/repositories/user/i_user_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../di/components/injection.dart';
import '../../sharedpref/shared_preference_helper.dart';

@Environment(Env.prod)
@Injectable(as: IUserRepository)
class ProdUserRepository implements IUserRepository  {

  // shared pref object
  SharedPreferenceHelper _sharedPrefsHelper;

  ProdUserRepository(this._sharedPrefsHelper);

  @override
  Future<bool> login(String email, String password) async => await Future.delayed(Duration(seconds: 2), ()=> true);
  @override
  Future<void> saveIsLoggedIn(bool value) async =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn async => _sharedPrefsHelper.isLoggedIn;
  
}