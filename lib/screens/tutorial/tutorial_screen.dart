import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo('Paso 1', 'Agregar Ketchups y Huevos por alguna razón.',
      'assets/images/tutorial/1.png'),
  SlideInfo('Paso 2', 'Subirse a una moto con una caja robada.',
      'assets/images/tutorial/2.png'),
  SlideInfo('Paso 3', 'Comer pedazos de la camiseta de tu compa.',
      'assets/images/tutorial/3.png')
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class TutorialScreen extends StatefulWidget {
  static const screenName = 'tutorial_screen';
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController pageNewController = PageController();
  bool endPage = false;
  @override
  void initState() {
    super.initState();
    pageNewController.addListener(() {
      final numPage = pageNewController.page ?? 0;
      setState(() {
        endPage = numPage >= (slides.length - 1.5);
      });
    });
  }

  @override
  void dispose() {
    pageNewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageNewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideItem) => _Slide(
                    title: slideItem.title,
                    caption: slideItem.caption,
                    imageUrl: slideItem.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir', style: TextStyle(fontWeight: FontWeight.w500),),
                onPressed: () => context.pop(),
              )),
          endPage
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle?.copyWith(color: Colors.blue, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
