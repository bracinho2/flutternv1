import 'package:dio/dio.dart';
import 'package:flutternv1/models/post_model.dart';
import 'package:flutternv1/repositories/home_repository.dart';

class HomeRepositoryImpl implements IHomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error in a Dio: ' + e.toString());
    }
    return [];
  }
}
