import 'package:flutter/material.dart';
import 'package:x_responsive/x_responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'x_responsive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'x_responsive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Responsive(
            condition: Condition(
              screenMin: Breakpoint.xs,
              screenMax: Breakpoint.md,
              platforms: [Platform.all],
            ),
            child: const Text('A'),
          ),
          Responsive(
            condition:
                Condition.screenBetween(min: Breakpoint.sm, max: Breakpoint.md),
            child: const Text('B'),
          ),
          Responsive(
            condition:
                Condition.screenBetween(min: Breakpoint.sm, max: Breakpoint.md)
                  ..platforms([Platform.all]),
            child: const Text('C'),
          ),
          Responsive.condition(
            condition: Condition.screenUp(Breakpoint.md),
            child: const Text('D'),
          ),
          Responsive.conditions({
            Condition.screenBetween(min: Breakpoint.sm, max: Breakpoint.md):
                const Text('E'),
            Condition.screenBetween(min: Breakpoint.md, max: Breakpoint.xl):
                const Text('F'),
          }),
          Responsive.conditions({
            Condition.screenUp(Breakpoint.xs): const Text('G'),
            Condition.screenUp(Breakpoint.sm): const Text('H'),
          }),
          Container(
            child: Condition.screenUp(Breakpoint.md).check(context)
                ? const Text('I')
                : const Text('J'),
          ),
        ],
      ),
    );
  }
}
