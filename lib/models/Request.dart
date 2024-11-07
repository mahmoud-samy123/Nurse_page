import 'package:flutter/material.dart';
import 'package:lovenurse/models/SelectedServicesPage.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final List<Map<String, String>> services = [
    {
      'name': 'Vaccination',
      'image': 'images/image5.png',
      'price': 'Price: 1',
    },
    {
      'name': 'Wound Dressing',
      'image': 'images/image6.png',
      'price': 'Price: 2',
    },
    {
      'name': 'Cannula Installation',
      'image': 'images/images7.png',
      'price': 'Price: 1',
    },
    {
      'name': 'Lotion Application',
      'image': 'images/image8.png',
      'price': 'Price: 1',
    },
    {
      'name': 'Blood Sugar Measurement',
      'image': 'images/image9.png',
      'price': 'Price: 1',
    },
    {
      'name': 'Blood Pressure Measurement',
      'image': 'images/image10.png',
      'price': 'Price: 1',
    },
  ];

  List<int> selectedIndices = [];

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Service(s)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4 / 5,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(index),
                    child: ServiceCard(
                      name: services[index]['name']!,
                      imageUrl: services[index]['image']!,
                      price: services[index]['price']!,
                      isSelected: selectedIndices.contains(index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final selectedServices =
                      selectedIndices.map((index) => services[index]).toList();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedServicesPage(
                          selectedServices: selectedServices),
                    ),
                  );
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final bool isSelected;

  ServiceCard({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue.shade100 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.blueAccent,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 120,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
