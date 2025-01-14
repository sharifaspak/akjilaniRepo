import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'tabs/retail_tab.dart';
import 'tabs/wholesale_tab.dart';
import 'tabs/manufacture_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AK Jilani Garments',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      'assets/banners/image1.jpg',
      'assets/banners/image2.jpg',
      'assets/banners/image3.jpg',
      // Add more images as needed
    ];

    final CarouselController _controller = CarouselController();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AK Jilani Garments'),
              BlinkingText(
                text: 'Crafting styles for your modern business',
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              color: Colors.green[700],
              child: const TabBar(
                indicatorColor: Colors.yellow,
                indicatorWeight: 4.0,
                labelColor: Colors.yellow,
                unselectedLabelColor: Colors.white70,
                labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'Retail'),
                  Tab(text: 'Wholesale'),
                  Tab(text: 'Manufacture for me'),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            // Banner section with sliding images
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: bannerImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the container
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            // TabBarView section
            const Expanded(
              child: TabBarView(
                children: [
                  RetailTab(),
                  WholesaleTab(),
                  ManufactureTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlinkingText extends StatefulWidget {
  final String text;
  const BlinkingText({required this.text, super.key});

  @override
  _BlinkingTextState createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: double.infinity, // or specify a fixed width
        padding: const EdgeInsets.all(8.0), // add padding if needed
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}