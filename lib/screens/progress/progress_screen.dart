import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/appBars/app_bar_custom.dart';

class ProgressScreen extends StatelessWidget with AppBarCustom{
  static const screenName = 'progress_screen';
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithReturnButton(title: 'Progress Indicators'),
      body: const _ProgressView(),
    );
  }

}

class _ProgressView extends StatelessWidget{
  const _ProgressView();
  
  @override
  Widget build(BuildContext context) {
    return const Center(child: 
      Column(
        children: [
          Separator(),
          Text('Circular Progress Indicator', style: TextStyle(fontSize: 20),),
          CircularProgressIndicator( strokeWidth: 2, backgroundColor: Colors.amber,),
          Separator(),
          Text('Linear Progress Indicator', style: TextStyle(fontSize: 20),),
          LinearProgressIndicator( value: 0.5, backgroundColor: Colors.amber,),
          Separator(),
          Text('Refresh Indicator', style: TextStyle(fontSize: 20),),
          Separator(),
          _ControllersProgressIndicator()
        ],
      ),);
  }
}

// Separator to prevent reused settings or different heights
class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20,);
  }
}

class _ControllersProgressIndicator extends StatelessWidget {
  const _ControllersProgressIndicator();

  double progressCondition(int value) => (value * 2) / 100;
  bool progressLimit(double value) => value < 100;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          Stream.periodic(const Duration(milliseconds: 300), progressCondition)
              .takeWhile(progressLimit),
      builder: (context, snapshot) =>
          progressIndicatorCustom(snapshot.data ?? 0),
    );
  }

  Widget progressIndicatorCustom(double progressValue) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            circularProgressCustom(progressValue),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: LinearProgressIndicator(
              value: progressValue,
            ))
          ],
        ),
      );

  Widget circularProgressCustom(double progressValue) =>
      CircularProgressIndicator(
          value: progressValue,
          strokeWidth: 2,
          backgroundColor: Colors.black12);
}
