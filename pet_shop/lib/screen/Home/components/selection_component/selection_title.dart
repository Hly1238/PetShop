import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/category.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/route/route_generator.dart';

class SelectionTitle extends StatelessWidget {
  final String name;
  final String id;
  final bool isCategory;

  const SelectionTitle({
    Key? key,
    required this.name,
    this.isCategory = false,
    this.id = "0",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    String displayText = name;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              displayText,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () async {
                if (isCategory) {
                  Navigator.of(context).pushNamed(Routes.list_category);
                } else {
                  var isDone = productController.getProductsByCategory(id);
                  if (await isDone) {
                    Navigator.of(context).pushNamed(
                      Routes.product_category,
                      arguments: SelectionTitleArguments(
                        name: name,
                        productList: productController.productList,
                        idCate: id,
                      ),
                    );
                  }
                }
              },
              child: !isCategory
                  ? Text(
                      "Xem thêm",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    )
                  : Text(""),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectionTitleArguments {
  final String name;
  final List<Product> productList;
  final String idCate;

  SelectionTitleArguments(
      {required this.name, required this.productList, required this.idCate});
}
