import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();

  // Dummy product list
  final List<String> products = ["Paracetamol",
    "Antacid",
    "Vitamin C",
    "Cough syrup",
    "Lexotanil",
    "Tammin",
    "Antacid plus",
    "Hexacol",
    "Formet",
    "Tafnil",
    "Vitamin D",
    "Lenatab",
    "Matronidozol",
    "Zolex",
    "Napa",
    "Napa Extend",
    "Borolin",
    "Napa Extra",
    "Floriz"];

  String? selectedProduct;
  List<Map<String, dynamic>> orders = []; // store orders locally

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Product Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Select Product",
                      border: OutlineInputBorder(),
                    ),
                   initialValue:  selectedProduct,
                    items: products.map((product) {
                      return DropdownMenuItem(
                        value: product,
                        child: Text(product),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedProduct = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? "Please select a product" : null,
                  ),
                  SizedBox(height: 12),

                  // Quantity Input
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter quantity";
                      }
                      if (int.tryParse(value) == null) {
                        return "Enter a valid number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),

                  // Save Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          orders.add({
                            "product": selectedProduct,
                            "quantity": int.parse(_quantityController.text),
                          });
                          selectedProduct = null;
                          _quantityController.clear();
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Order added successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: Text("Add Order"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            //Orders List 
            Expanded(
              child: orders.isEmpty
                  ? Center(child: Text("No orders yet"))
                  : ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: Icon(Icons.shopping_cart, color: Colors.blue),
                            title: Text(order["product"]),
                            subtitle: Text("Quantity: ${order["quantity"]}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
