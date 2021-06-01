import 'package:boilerplate/data/repositories/lang/i_lang_repository.dart';
import 'package:injectable/injectable.dart';

import '../../sharedpref/shared_preference_helper.dart';

@Injectable()
class LangRepository implements ILangRepository {

  SharedPreferenceHelper _sharedPrefsHelper;
  LangRepository(this._sharedPrefsHelper);

  @override
  Future<void> changeLanguage(String value) => _sharedPrefsHelper.changeLanguage(value);

  @override
  // TODO: implement currentLanguage
  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;

}