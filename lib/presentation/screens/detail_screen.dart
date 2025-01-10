import 'package:flutter/material.dart';
import 'package:primehealth/domain/model/items_model.dart';


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(item.image, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Updated: ${item.time}"),
                  SizedBox(height: 8),
                  Text(
                    "\$${item.discountPrice} (Original: \$${item.price})",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  Text(item.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
