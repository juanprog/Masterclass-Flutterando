import 'package:flutter/material.dart';

class TinderPage extends StatefulWidget {
  const TinderPage({super.key});

  @override
  State<TinderPage> createState() => _TinderPageState();
}

class _TinderPageState extends State<TinderPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xfffd5564),
              Color(0xffef4a75),
            ],
          ),
        ),
        child: Column(
          children: [
            backButton(context),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Image.asset(
              'assets/icons/logo_tinder.png',
              height: 150,
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            description(),
            const SizedBox(height: 24),
            SignButtonWidget(
              text: 'SIGN IN WITH APPLE',
              icon: Image.asset(
                'assets/icons/apple_logo.png',
                height: 24,
              ),
            ),
            const SizedBox(height: 8),
            SignButtonWidget(
              text: 'SIGN IN WITH FACEBOOK',
              icon: Image.asset(
                'assets/icons/facebook_logo.png',
                height: 24,
              ),
            ),
            const SizedBox(height: 8),
            SignButtonWidget(
              text: 'SIGN IN WITH PHONE NUMBER',
              icon: Image.asset(
                'assets/icons/ballon.png',
                height: 24,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Trouble Signing In?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row backButton(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {/* Navigator.pop(context) */},
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  RichText description() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
        ),
        text: 'By tapping Create Account ou Sign In, you agree to our ',
        children: [
          TextSpan(
            text: 'Terms',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '. Learn how we proccess your data in out ',
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Cookies Policy',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SignButtonWidget extends StatelessWidget {
  final String text;
  final Image icon;
  const SignButtonWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          icon,
          const Expanded(
            child: SizedBox.shrink(),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
