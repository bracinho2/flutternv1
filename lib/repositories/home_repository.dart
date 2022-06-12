import 'package:flutternv1/models/post_model.dart';

abstract class IHomeRepository {
  Future<List<PostModel>> getList();
}
