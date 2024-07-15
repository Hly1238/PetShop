import 'package:flutter/material.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/product.dart';

class ProductCategory extends StatefulWidget {
  final String name;
  final List<Product> productList;
  const ProductCategory({
    Key? key,
    required this.productList,
    required this.name,
  }) : super(key: key);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var products = ProductController.instance.productList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${widget.name}'),
      ),
      body: !products.isEmpty
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  // You can add more product details here
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
