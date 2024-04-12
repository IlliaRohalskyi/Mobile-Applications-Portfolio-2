import 'package:flutter/material.dart';

void main() {
  runApp(ImageCarouselApp());
}

class ImageCarouselApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Carousel'),
        ),
        body: ImageCarousel(),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  List<String> _imageUrls = [
    'assets/images/1.jpeg',
    'assets/images/2.jpg',
    'assets/images/3.jpeg',
    'assets/images/4.jpg'
    ];

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _imageUrls.length;
      if (_currentIndex < 0) {
        _currentIndex = _imageUrls.length - 1;
      }
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          _imageUrls[_currentIndex],
          width: 300,
          height: 300,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _previousImage,
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: _nextImage,
            ),
          ],
        ),
      ],
    );
  }
}
