import 'package:flutter/material.dart';

import 'package:flutternv1/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonComponent({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inloader, __) => inloader
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: const Text('Login Failed!'),
                        duration: const Duration(seconds: 1),
                        action: SnackBarAction(
                          label: 'label',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                });
              },
              child: const Text('Login'),
            ),
    );
  }
}
