import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'portfolio_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late File image = File('');

  Future getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedImage as File;
    });
  }

  final List<String> services = [
    "Hairstylist",
    "Make-up Artist",
    "Manicure",
    "Pedicure",
    "Fashion Designer",
    "Photographer"
  ];
  String? selectedService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: const Text('Create Your Artisan Profile'),
        titleTextStyle: const TextStyle(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: image == null
                        ? const DecorationImage(
                            image: AssetImage('assets/images/person.jpg'),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: FileImage(image),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: getImage,
                  child: const Text('Upload Profile Picture'),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Location'),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Website'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Social Media Links:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Facebook'),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Twitter'),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Instagram'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Artisan Type:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Checkbox(
                      value: selectedService == 'Hairstylist',
                      onChanged: (value) {
                        setState(() {
                          selectedService = value! ? 'Hairstylist' : null;
                        });
                      },
                    ),
                    const Text('Hairstylist'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedService == 'Make-up Artist',
                      onChanged: (value) {
                        setState(() {
                          selectedService = value! ? 'Make-up Artist' : null;
                        });
                      },
                    ),
                    const Text('Make-up Artist'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedService == 'Manicure',
                      onChanged: (value) {
                        setState(() {
                          selectedService = value! ? 'Manicure' : null;
                        });
                      },
                    ),
                    const Text('Manicure'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedService == 'Pedicure',
                      onChanged: (value) {
                        setState(() {
                          selectedService = value! ? 'Pedicure' : null;
                        });
                      },
                    ),
                    const Text('Pedicure'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedService == 'Fashion Designer',
                      onChanged: (value) {
                        setState(() {
                          selectedService = value! ? 'Fashion Designer' : null;
                        });
                      },
                    ),
                    const Text('Fashion Designer'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedService == 'Photographer',
                      onChanged: (value) {
                        setState(() {
                          selectedService = value! ? 'Photographer' : null;
                        });
                      },
                    ),
                    const Text('Photographer'),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PortfolioScreen(),
                    ),
                  ),
                  child: const Text('Create Portfolio'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
