import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesPage> {
  int _currentIndex = 0;

  final Map<String, TextEditingController> priceControllers = {
    "Vaccination": TextEditingController(),
    "Changing wounds": TextEditingController(),
    "Cannula installation": TextEditingController(),
    "Installation of lotion": TextEditingController(),
    "Blood Sugar Measurement": TextEditingController(),
    "Blood Pressure Measurement": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Services", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child:
                        _buildRectangularButton("Edit Services", Colors.blue)),
                SizedBox(width: 16),
                Expanded(
                    child:
                        _buildRectangularButton("Add Services +", Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildServiceCard("Vaccination", "assets/vaccine.png"),
                  _buildServiceCard("Changing wounds", "assets/wound.png"),
                  _buildServiceCard(
                      "Cannula installation", "assets/cannula.png"),
                  _buildServiceCard(
                      "Installation of lotion", "assets/lotion.png"),
                  _buildServiceCard(
                      "Blood Sugar Measurement", "assets/blood_sugar.png"),
                  _buildServiceCard("Blood Pressure Measurement",
                      "assets/blood_pressure.png"),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildSaveButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildRectangularButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildServiceCard(String serviceName, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 50),
          SizedBox(height: 8),
          Text(serviceName, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: priceControllers[serviceName],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _showPrices();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        ),
        child:
            Text("Save", style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  void _showPrices() {
    String prices = priceControllers.entries
        .map((entry) =>
            "${entry.key}: ${entry.value.text.isNotEmpty ? entry.value.text : 'Not set'}")
        .join("\n");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Entered Prices"),
          content: Text(prices),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
