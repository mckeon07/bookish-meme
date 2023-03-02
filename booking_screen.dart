import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'edit_service_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _ArtisanBookingScreenState createState() => _ArtisanBookingScreenState();
}

class _ArtisanBookingScreenState extends State<BookingScreen> {
  // Define variables to store data
  List<String> services = [
    "Hair Styling - 60 min - \$80",
    "Makeup - 90 min - \$120",
    "Nail Art - 45 min - \$60",
    "Fashion Design - 120 min - \$200",
    "Photography - 180 min - \$300"
  ];
  List<DateTime> availableDates = [];
  List<Appointment> appointments = [];
  List<Client> clients = [];
  bool isLoading = true;

  get serviceName => null;

  get servicePrice => null;

  @override
  void initState() {
    super.initState();
    // Load data from database or network
    loadData();
  }

  void loadData() async {
    // Load services, availability, appointments, clients from database or network
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        titleTextStyle: const TextStyle(color: Colors.black),
        title: Text("Booking and Scheduling"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/images/some.jpg'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Fredricka Yeboah",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Calendar view
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CalendarCarousel(
                      onDayPressed: (DateTime date, List events) {
                        // Handle calendar day press
                      },
                      weekendTextStyle: TextStyle(
                        color: Colors.red,
                      ),
                      thisMonthDayBorderColor: Colors.grey,
                      height: 420.0,
                      daysHaveCircularBorder: false,
                    ),
                  ),
                  // Service selection
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Services",
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
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return Text(
                              services[index],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditServiceScreen(
                                  serviceName: serviceName,
                                  servicePrice: servicePrice,
                                  onUpdateServiceName: (String newName) {},
                                ),
                              ),
                            ).then((result) {
                              if (result != null) {
                                setState(() {
                                  String serviceName = result[0];
                                  double servicePrice = result[1];
                                });
                              }
                            });
                          },
                          child: Text("Edit Service"),
                        ),
                      ],
                    ),
                  ),
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
                              .map((date) => InkWell(
                                    onTap: () {
// Handle availability time selection
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                      child: Text(
                                        date.toString(),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
// Handle adding new availability
                          },
                          child: Text("Add Availability"),
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
                          itemCount: appointments.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
// Handle appointment details display
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            appointments[index].service,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            appointments[index]
                                                .client
                                                .fullName(),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            appointments[index]
                                                .dateTime
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
// Handle appointment cancellation
                                      },
                                      icon: Icon(Icons.cancel),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
// Handle adding new appointment
                          },
                          child: Text("Add Appointment"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.yellow[600],
        // unselectedItemColor:
        //     Colors.black, // <-- set the unselected item color here
        // onTap: _onItemTapped,
      ),
    );
  }
}

class Appointment {
  final String service;
  final DateTime dateTime;
  final Client client;

  Appointment(
      {required this.service, required this.dateTime, required this.client});
}

class Client {
  final String firstName;
  final String lastName;

  Client({required this.firstName, required this.lastName});

  String fullName() {
    return "$firstName $lastName";
  }
}
