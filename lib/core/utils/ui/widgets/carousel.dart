import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/configs/themes/palette.dart';

class Carousel extends StatelessWidget {
  Carousel({Key? key, required this.imageList}) : super(key: key);

  final List<String> imageList;

  final ValueNotifier<int> _current = ValueNotifier<int>(0);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageList
              .map(
                (item) => Container(
                  margin: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                ),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              _current.value = index;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: ValueListenableBuilder(
                valueListenable: _current,
                builder: (context, _, __) => Container(
                  width: 8,
                  height: 8,
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Palette.primaryColorLight.withOpacity(
                      _current.value == entry.key ? 0.9 : 0.4,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
