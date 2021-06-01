abstract class IThememRepository {
  Future<void> changeBrightnessToDark(bool value);
  bool get isDarkMode;
}