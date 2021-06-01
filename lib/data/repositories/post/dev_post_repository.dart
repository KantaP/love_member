import 'package:injectable/injectable.dart';

import '../../../di/components/injection.dart';
import 'i_post_repository.dart';

import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import '../../network/apis/posts/post_api.dart';

@Environment(Env.dev)
@Injectable(as: IPostRepository)
class DevPostRepository extends IPostRepository {

  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // constructor
  DevPostRepository(this._postDataSource, this._postApi) : super(_postApi, _postDataSource);
}