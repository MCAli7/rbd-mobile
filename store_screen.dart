import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  static String routeName = 'StoreScreen';

  @override
  Widget build(BuildContext context) {
    // Example list of product titles
    final List<String> productTitles = [
      'Sticker', 'Patch', 'Gantungan', 'Keychain', 'Enamel Pin', 'Keychain Sun Pouch', 
      'Green Pouch', 'Totebag', 'Tumbler', 'Keychain Starplush', 'Topi D Study Club', 'Topi D', 
      'Kaos Bound by Knowledge', 'Kaos Knowledge and Wisdom', 'Hoodie Ver. 1', 'Hoodie Ver. 2', 'Knit Vest'
    ];

    // Example list of points for each product
    final List<int> productPoints = [
      5, 25, 50, 75, 30, 60, 100, 20, 80, 45, 
      55, 40, 35, 90, 15, 70, 65
    ];

    // Example list of progress percentages for each product
    final List<int> productProgress = [
      37, 67, 50, 75, 22, 48, 89, 95, 10, 55, 
      33, 60, 83, 12, 45, 29, 71
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store',
          style: TextStyle(
            color: Colors.white, // Set text color to white
          ),
        ),
        backgroundColor: const Color(0xFF357A77),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set icon color to white
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Filter action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Product • 17', // The title text and count of products
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // Adjust height of the items
                ),
                itemCount: 17, // Total number of products (17 items)
                itemBuilder: (context, index) {
                  return buildStoreGridItem(
                    context,
                    'assets/images/stickers.png', // Use your image path here
                    productTitles[index], // Dynamic product title
                    productPoints[index], // Dynamic product points
                    productProgress[index], // Dynamic progress percentage
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each grid item in the store
  Widget buildStoreGridItem(BuildContext context, String imagePath, String title, int points, int progress) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 100, // Adjust height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Product Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            // Points Display
            Row(
              children: [
                const Icon(Icons.monetization_on, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(
                  '$points Points',
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Progress Bar
            Stack(
              children: [
                Container(
                  height: 8.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 8.0,
                  width: MediaQuery.of(context).size.width * (progress / 100) / 2,
                  decoration: BoxDecoration(
                    color: progress >= 50 ? Colors.blue : Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Progress Percentage
            Text(
              '$progress%',
              style: TextStyle(
                fontSize: 12,
                color: progress >= 50 ? Colors.blue : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
