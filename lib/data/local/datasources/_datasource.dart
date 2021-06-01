import 'package:sembast/sembast.dart';

abstract class DataSource {

  // DB functions:--------------------------------------------------------------
  Future<int> insert(dynamic data);

  Future<int> count();

  Future<List> getAllSortedByFilter({List<Filter>? filters});

  getList();

  Future<int> update(dynamic data);

  Future<int> delete(dynamic data);

  deleteAll();

}
