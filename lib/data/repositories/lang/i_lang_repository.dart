abstract class ILangRepository {
  Future<void> changeLanguage(String value);
  String? get currentLanguage;
}