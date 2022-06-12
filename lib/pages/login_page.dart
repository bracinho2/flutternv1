import 'package:flutter/material.dart';
import 'package:flutternv1/components/login/custom_login_button_component.dart';
import 'package:flutternv1/controllers/login_controller.dart';
import 'package:flutternv1/widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    LoginController _loginController = LoginController();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: screenSize.height * 0.3),
            CustomTextFieldWidget(
              onChanged: _loginController.setLogin,
              label: 'Usuário',
            ),
            CustomTextFieldWidget(
              onChanged: _loginController.setPassword,
              label: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 15),
            CustomLoginButtonComponent(
              loginController: _loginController,
            ),
          ],
        ),
      ),
    );
  }
}
