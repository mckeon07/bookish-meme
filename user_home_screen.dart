import 'package:flutter/material.dart';

class GlamSpotHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlamSpot'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the user profile screen
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero section
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_hero.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 16,
                    child: Text(
                      'Welcome to GlamSpot',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the booking screen
                      },
                      child: Text('Book Appointment'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Services section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceCard(
                        serviceName: 'Haircut',
                        servicePrice: 50.0,
                        imagePath: 'assets/images/haircut.jpg',
                      ),
                      ServiceCard(
                        serviceName: 'Manicure',
                        servicePrice: 30.0,
                        imagePath: 'assets/images/manicure.jpg',
                      ),
                      ServiceCard(
                        serviceName: 'Makeup',
                        servicePrice: 60.0,
                        imagePath: 'assets/images/makeup.jpg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // About section
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About GlamSpot',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'GlamSpot is your go-to destination for beauty services. Our team of experienced and highly skilled professionals are here to help you look and feel your best.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
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

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final double servicePrice;
  final String imagePath;

  ServiceCard({
    required this.serviceName,
    required this.servicePrice,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the service details screen
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(height: 8),
            Text(
              serviceName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '\$$servicePrice',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
