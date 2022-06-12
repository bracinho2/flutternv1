import 'package:flutter/material.dart';
import 'package:flutternv1/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: Container(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                args.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                args.body,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Notícia: ${args.id.toString()}, Autor: ${args.userId}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ));
  }
}
