import 'package:flutter/material.dart';
import 'retail_tab.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Item item;

  const ProductDetailsScreen({super.key, required this.item});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String selectedImageUrl;

  @override
  void initState() {
    super.initState();
    selectedImageUrl = widget.item.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    // Example list of additional images for the product
    final List<String> additionalImages = [
      widget.item.imageUrl,
      'https://www.mumkins.in/cdn/shop/files/girls-frock-gs173277-rama-1.jpg',
      'https://www.mumkins.in/cdn/shop/products/frock-for-girls-gs171818-red-1.jpg',
      // Add more image URLs here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.dressName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the selected image in a frame with magnifying effect
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: InteractiveViewer(
                child: Image.network(
                  selectedImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Display the details and thumbnails
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the thumbnails
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: additionalImages.map((imageUrl) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageUrl = imageUrl;
                          });
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16.0),
                  // Display the product details
                  Text(
                    widget.item.dressName,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Price: ${widget.item.priceRange}'),
                  const SizedBox(height: 8.0),
                  Text('Available Sizes: ${widget.item.sizeRange}'),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'This is a detailed description of the product. It includes information about the material, design, and other features of the product.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}