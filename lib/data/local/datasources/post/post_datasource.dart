import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/data/local/datasources/_datasource.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

@Singleton()
class PostDataSource implements DataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _store = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  //  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Database _db;

  // Constructor
  PostDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  @override
  Future<int> insert(dynamic _post) async {
    Post post = _post;
    return await _store.add(await _db, post.toMap());
  }

  @override
  Future<int> count() async {
    return await _store.count(await _db);
  }

  @override
  Future<List<Post>> getAllSortedByFilter({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _store.find(
      await _db,
      finder: finder,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final post = Post.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      post.id = snapshot.key;
      return post;
    }).toList();
  }

  @override
  Future<PostList> getList() async {

    print('Loading from database');

    // post list
    var postsList;

    // fetching data
    final recordSnapshots = await _store.find(
      await _db,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if(recordSnapshots.length > 0) {
      postsList = PostList(
          posts: recordSnapshots.map((snapshot) {
            final post = Post.fromMap(snapshot.value);
            // An ID is a key of a record from the database.
            post.id = snapshot.key;
            return post;
          }).toList());
    }

    return postsList;
  }

  @override
  Future<int> update(dynamic _post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    Post post = _post;
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _store.update(
      await _db,
      post.toMap(),
      finder: finder,
    );
  }

  @override
  Future<int> delete(dynamic _post) async {
    Post post = _post;
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _store.delete(
      await _db,
      finder: finder,
    );
  }

  @override
  Future deleteAll() async {
    await _store.drop(
      await _db,
    );
  }

}
