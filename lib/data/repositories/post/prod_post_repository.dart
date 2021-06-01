import 'package:injectable/injectable.dart';

import '../../../di/components/injection.dart';
import 'i_post_repository.dart';

import 'package:boilerplate/data/local/datasources/post/post_datasource.dart';
import '../../network/apis/posts/post_api.dart';

@Environment(Env.prod)
@Injectable(as: IPostRepository)
class ProdPostRepository extends IPostRepository {

  // data source object
  late final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // constructor
  ProdPostRepository(this._postDataSource, this._postApi) : super(_postApi, _postDataSource);
}