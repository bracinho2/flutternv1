import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutternv1/models/post_model.dart';
import 'package:flutternv1/repositories/home_repository.dart';

class HomeRepositoryMock implements IHomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');

    List postJson = jsonDecode(value);

    return postJson.map((post) => PostModel.fromJson(post)).toList();
  }
}
