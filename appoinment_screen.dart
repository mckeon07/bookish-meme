import 'package:flutter/material.dart';

import 'booking_screen.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${appointment.client.firstName} ${appointment.client.lastName}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${appointment.dateTime.month}/${appointment.dateTime.day}/${appointment.dateTime.year} at ${appointment.dateTime.hour}:${appointment.dateTime.minute.toString().padLeft(2, '0')}",
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
