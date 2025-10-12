import 'package:flutter/material.dart';
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final _formkey=GlobalKey<FormState>();
  final TextEditingController quantityController=TextEditingController();

  //Dummy list of drugs(products)
  final List <String> products=["Paracetamol",
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
//List to store all the orders(each order= Map with product and quantity)
List<Map<String,dynamic>> orders=[];

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Select Product",
                      border: OutlineInputBorder(),
                    ),
                    value: selectedProduct, //current selection
                    items: products.map((product) {
                      return DropdownMenuItem<String>(
                        value: product, // Added missing value property
                        child: Text(product),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedProduct = value; //update selection
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select a product";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),

                  //Quantity Input
                  TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter quantity";
                      }
                      final quantity = int.tryParse(value);
                      if (quantity == null || quantity <= 0) {
                        return "Enter a valid positive number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  
                  //Save button - Full width
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //validate form inputs
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            //Add order to the list
                            orders.add({
                              "product": selectedProduct,
                              "quantity": int.parse(quantityController.text),
                            });
                            //reset fields after saving
                            selectedProduct = null;
                            quantityController.clear();
                          });

                          //show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Order added successfully"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text("Add Order"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          Expanded(
            child: orders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 60, color: Colors.grey),
                        SizedBox(height: 10),
                        Text("No orders yet", style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Icon(Icons.shopping_cart, color: Colors.blue),
                          title: Text(orders[index]["product"]),
                          subtitle: Text("Quantity: ${orders[index]["quantity"]}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                orders.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Order deleted"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    ),
    );
  }
}