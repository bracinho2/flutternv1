import 'package:flutter/material.dart';
import 'package:flutternv1/models/post_model.dart';
import 'package:flutternv1/repositories/home_repository.dart';

class HomeController {
  final IHomeRepository _iHomeRepository;

  HomeController(this._iHomeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier([]);

  fetch() async {
    posts.value = await _iHomeRepository.getList();
  }
}
