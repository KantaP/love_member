import 'package:sembast/sembast.dart';

import '../../../models/post/post.dart';
import '../../../models/post/post_list.dart';
import '../../local/constants/db_constants.dart';
import '../../local/datasources/post/post_datasource.dart';
import '../../network/apis/posts/post_api.dart';

class IPostRepository {

  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // constructor
  IPostRepository(this._postApi, this._postDataSource);

  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  
  Future<PostList> getPosts() async {
    return await _postApi.getPosts().then((postsList) {
      postsList.posts?.forEach((post) {
        _postDataSource.insert(post);
      });

      return postsList;
    }).catchError((error) => throw error);
  }

  
  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  
  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  
  Future<int> delete(Post post) => _postDataSource
      .delete(post)
      .then((id) => id)
      .catchError((error) => throw error);
  
}