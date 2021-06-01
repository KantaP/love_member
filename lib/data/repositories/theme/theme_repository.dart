import 'package:boilerplate/data/repositories/theme/i_theme_repository.dart';
import 'package:injectable/injectable.dart';
import '../../sharedpref/shared_preference_helper.dart';

@Injectable()
class ThemeRepository implements IThememRepository {

  SharedPreferenceHelper _sharedPrefsHelper;
  ThemeRepository(this._sharedPrefsHelper);

  @override
  Future<void> changeBrightnessToDark(bool value) => _sharedPrefsHelper.changeBrightnessToDark(value);

  @override
  // TODO: implement isDarkMode
  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

}