import 'package:flutter/material.dart';

import 'package:lovenurse/models/request.dart';
import 'package:lovenurse/models/view.dart';

class SearchResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Search by City",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(Icons.notifications, color: Colors.blue),
          SizedBox(width: 16),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: "Cairo",
                    items: ["Cairo", "Alexandria", "Giza"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: "AlN Shams",
                    items: ["AlN Shams", "Nasr City", "Heliopolis"]
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Result",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildCard("Sama Ahmed", 'images/image11.png', context),
                  buildCard("Mariam Mohammed", 'images/image11.png', context),
                  buildCard("Mohammed Ali", 'images/image11.png', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Define the pages you want to navigate to
  void navigateToRequestPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RequestPage()),
    );
  }

  void navigateToViewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewPage()),
    );
  }

  Widget buildCard(String name, String imagePath, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () => navigateToRequestPage(context),
                child: Text("Request"),
              ),
              SizedBox(width: 8),
              OutlinedButton(
                onPressed: () => navigateToViewPage(context),
                child: Text("View"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
