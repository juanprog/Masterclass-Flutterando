import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio do Botão Flutuante',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Desafio do Botão Flutuante'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isContainerBottom = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final height = isContainerBottom ? 50.0 : 50.0;
    final width = isContainerBottom ? 50.0 : 90.0;
    
    final right = isContainerBottom ? 20.0 : ((size.width - width) / 2);
    final bottom = isContainerBottom ? 20.0 : (size.height - 150);
    final top = isContainerBottom ? (size.height - 150) : 20.0;
    
    final radius = isContainerBottom ? 25.0 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            right: right,
            top: top,
            bottom: bottom,
            child: InkWell(
              onTap: () {
                setState(() {
                  isContainerBottom = !isContainerBottom;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
