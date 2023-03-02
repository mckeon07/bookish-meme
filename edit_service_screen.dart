import 'package:flutter/material.dart';

class EditServiceScreen extends StatefulWidget {
  final String serviceName;
  final double servicePrice;

  EditServiceScreen(
      {required this.serviceName,
      required this.servicePrice,
      required void Function(String newName) onUpdateServiceName});

  @override
  _EditServiceScreenState createState() => _EditServiceScreenState();
}

class _EditServiceScreenState extends State<EditServiceScreen> {
  late String _serviceName;
  late double _servicePrice;

  @override
  void initState() {
    super.initState();
    _serviceName = widget.serviceName;
    _servicePrice = widget.servicePrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service Name",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              initialValue: _serviceName,
              onChanged: (value) {
                setState(() {
                  _serviceName = value;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              initialValue: _servicePrice.toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _servicePrice = double.parse(value);
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
// Pass edited service details back to the booking screen
                Navigator.pop(
                  context,
                  [_serviceName, _servicePrice],
                );
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
