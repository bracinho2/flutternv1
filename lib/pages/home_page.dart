import 'package:flutter/material.dart';
import 'package:flutternv1/controllers/home_controller.dart';
import 'package:flutternv1/models/post_model.dart';
import 'package:flutternv1/repositories/home_repository_impl.dart';
import 'package:flutternv1/repositories/home_repository_mock.dart';
import 'package:flutternv1/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(HomeRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page > Posts'),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts,
        builder: (_, posts, __) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(posts[index].title),
                //subtitle: Text(posts[index].body),
                leading: Text(posts[index].id.toString()),
                trailing: const Icon(Icons.arrow_circle_right),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/details', arguments: posts[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
