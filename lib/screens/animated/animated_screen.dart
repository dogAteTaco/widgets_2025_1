import 'dart:math';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/appBars/app_bar_custom.dart';

class AnimatedScreen extends StatefulWidget {
  static const screenName = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> with AppBarCustom {
  double width = 50;
  double height = 50;
  Color color = Colors.red;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    const int randomRange = 300;
    const double randomMin = 120;

    setState(() {
      width = random.nextInt(randomRange) + randomMin;
      height = random.nextInt(randomRange) + randomMin;
      borderRadius = random.nextInt(100) + 20;
      color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Animated Container'),
      floatingActionButton: FloatingActionButton(onPressed: changeShape, child: const Icon(Icons.play_arrow_rounded)),
      body: _AnimatedView(width, height, color, borderRadius),
    );
  }
}

class _AnimatedView extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  const _AnimatedView(
    this.width,
    this.height,
    this.color,
    this.borderRadius,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
