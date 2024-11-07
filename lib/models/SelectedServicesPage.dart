import 'package:flutter/material.dart';

import 'package:lovenurse/models/DateTimeSelectionPage.dart';

class SelectedServicesPage extends StatelessWidget {
  final List<Map<String, String>> selectedServices;

  SelectedServicesPage({required this.selectedServices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Services'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Text(
                  "Price of Services",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 4 / 5,
                ),
                itemCount: selectedServices.length,
                itemBuilder: (context, index) {
                  final service = selectedServices[index];
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: service['image'] != null
                              ? Image.asset(
                                  service['image']!,
                                  fit: BoxFit.contain,
                                )
                              : Container(
                                  color: Colors.grey,
                                  child: Icon(Icons.image_not_supported),
                                ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          service['name'] ?? 'No Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Price: ${service['price'] ?? 'N/A'}",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "00:00\$", // يمكنك تحديث هذا الجزء لحساب الإجمالي
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // الانتقال إلى صفحة اختيار التاريخ والوقت
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DateTimeSelectionPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  "Proceed to Date & Time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
