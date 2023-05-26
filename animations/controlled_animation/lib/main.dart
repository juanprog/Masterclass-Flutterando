import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = Tween<double>(begin: 50, end: 100).animate(animationController).value;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
            child: Container(
              color: Colors.blue,
              width: width,
              height: 50,
            ),
          ),
        ));
  }
}
