import 'package:audio_playlist/login/login.dart';
import 'package:audio_playlist/login/signUp.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
    isLogin ? Login() : Signup();
    
  
  void toggle() => setState(() =>
      isLogin = !isLogin);
  
}
