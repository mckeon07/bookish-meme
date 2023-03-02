import 'package:flutter/material.dart';

import 'appoinment_screen.dart';
import 'booking_screen.dart';
import 'edit_service_screen.dart';

class ArtisanBookingScreen extends StatefulWidget {
  const ArtisanBookingScreen({super.key});

  @override
  _ArtisanBookingScreenState createState() => _ArtisanBookingScreenState();
}

class _ArtisanBookingScreenState extends State<ArtisanBookingScreen> {
  String serviceName = "Haircut";
  double servicePrice = 50.0;
  void _updateServiceName(String newName) {
    setState(() {
      serviceName = newName;
    });
  }

  List<DateTime> availableDates = [
    DateTime(2022, 03, 15),
    DateTime(2022, 03, 16),
    DateTime(2022, 03, 17),
  ];
  List<Appointment> appointments = [
    Appointment(
      service: "Haircut",
      dateTime: DateTime(2022, 03, 18, 10, 0),
      client: Client(
        firstName: "John",
        lastName: "Doe",
      ),
    ),
    Appointment(
      service: "Haircut",
      dateTime: DateTime(2022, 03, 19, 14, 30),
      client: Client(
        firstName: "Jane",
        lastName: "Doe",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to service editing screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditServiceScreen(
                    serviceName: serviceName,
                    servicePrice: servicePrice,
                    onUpdateServiceName: _updateServiceName,
                  ),
                ),
              ).then((result) {
                if (result != null) {
                  setState(() {
                    serviceName = result[0];
                    servicePrice = result[1];
                  });
                }
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Service details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Service Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Service Name: $serviceName",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Price: \$${servicePrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Availability and Appointments
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                children: [
                  // Availability
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Availability",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Available dates:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: availableDates
                              .map((date) => Chip(
                                    label: Text(
                                      "${date.month}/${date.day}/${date.year}",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  // Appointments
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appointments",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: appointments.length,
                          itemBuilder: (context, index) {
                            return AppointmentCard(
                              appointment: appointments[index],
                            );
                          },
                        ),
                      ],
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
