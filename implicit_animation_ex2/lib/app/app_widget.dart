import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyScrollView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MyScrollView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
        controller: _scrollController,
        children: _expansionTile(),
      ),
    );
  }

  List<Widget> _expansionTile() {
    final tileList = <Widget>[];

    for (int i = 0; i < 20; i++) {
      tileList.add(
        CustomListTile(
          text: 'My expansion tile $i',
          index: i,
          scrollController: _scrollController,
        ),
      );
    }

    return tileList;
  }
}

class CustomListTile extends StatefulWidget {
  final String text;
  final int index;
  final ScrollController scrollController;

  const CustomListTile({
    Key? key,
    required this.text,
    required this.scrollController,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isExpanded = false;
  final double itemHeight = 50;
  double oldOffset = 0;

  @override
  Widget build(BuildContext context) {
    final turns = isExpanded ? 0.5 : 0.0;
    final color = isExpanded ? Colors.blue : Colors.black;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: isExpanded ? 1 : 0,
          child: const Divider(height: 0),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: itemHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: color,
                  ),
                ),
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.bottomCenter,
            heightFactor: isExpanded ? 1 : 0,
            onEnd: () {
              if (isExpanded) {
                _moveUp(itemHeight * widget.index);
              } else {
                _moveUp(oldOffset);
              }

              oldOffset = widget.scrollController.offset;
            },
            child: Column(
              children: [
                Image.asset('assets/flutter.png', height: 40),
                const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
              ],
            ),
          ),
        ),
        if (isExpanded) const Divider(height: 0),
      ],
    );
  }

  _moveUp(double position) async {
    if (position > widget.scrollController.position.maxScrollExtent) {
      await Future.delayed(const Duration(milliseconds: 10));
      position = widget.scrollController.position.maxScrollExtent;
    }

    widget.scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
