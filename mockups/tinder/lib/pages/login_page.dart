import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tinder/pages/tinder_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const LogoWidget(),
            const SizedBox(height: 30),
            const Text(
              'Get your Money Under Control',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Manage your expenses. Seamlessly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            const SignButton(
              color: Color.fromARGB(255, 55, 45, 240),
              text: Text(
                'Sign Up With Email ID',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SignButton(
              color: Colors.white,
              text: const Text(
                'Sign Up With Google',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Image.network(
                'assets/icons/google.png',
                height: 18,
              ),
            ),
            const SizedBox(height: 30),
            Text.rich(
              style: const TextStyle(
                color: Colors.white,
              ),
              TextSpan(
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                    text: 'Sign In',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TinderLoginPage()));
                      },
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 105,
        height: 105,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 45, 240),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 50,
                  width: 50,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 55, 45, 240),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 55, 45, 240),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: 105,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class SignButton extends StatelessWidget {
  final Text text;
  final Color color;
  final Image? icon;
  const SignButton({
    super.key,
    required this.text,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            if (icon != null) const SizedBox(width: 10),
            text,
          ],
        ),
      ),
    );
  }
}
