import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/screen/Product/components/product_loading_grid.dart';
import 'package:pet_shop/screen/Product/components/product_showing_grid.dart';

class ProductCategory extends StatefulWidget {
  final String name;
  final List<Product> productList;
  const ProductCategory({
    Key? key,
    this.productList = const [],
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
    if (widget.productList == []) {
      widget.productList.assignAll(ProductController.instance.productList);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Products in ${widget.name}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (widget.productList.isNotEmpty) {
                return ProductShowingGrid(productList: widget.productList);
              } else {
                return ProductLoadingGrid();
              }
            }),
          ),
        ],
      ),
    );

    // List<String> filters = ['Pipeline', 'Pipeline2'];
    // String selectedSortBy = 'Popularity';
    // double selectedRating = 4.5;
    // RangeValues selectedPriceRange = RangeValues(20, 75);

    // void _openFilterDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return FilterDialog(
    //         selectedSortBy: selectedSortBy,
    //         selectedRating: selectedRating,
    //         selectedPriceRange: selectedPriceRange,
    //         onApplyFilters: (sortBy, rating, priceRange) {
    //           setState(() {
    //             selectedSortBy = sortBy;
    //             selectedRating = rating;
    //             selectedPriceRange = priceRange;
    //           });
    //           print('Selected Filters:');
    //           print('Sort By: $selectedSortBy');
    //           print('Rating: $selectedRating');
    //           print(
    //               'Price Range: \$${selectedPriceRange.start} - \$${selectedPriceRange.end}');
    //         },
    //       );
    //     },
    //   );
    // }

    // // // !!!!!!!!!!!!!!!
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Your Pet Needs'),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         onPressed: () {
    //           // Search action
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.shopping_cart),
    //         onPressed: () {
    //           // Cart action
    //         },
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           // Filter chips
    //           // Filter chips
    //           Wrap(
    //             spacing: 8.0,
    //             children: filters
    //                 .map((filter) => FilterChip(
    //                       label: Text(filter),
    //                       onDeleted: () {
    //                         setState(() {
    //                           filters.remove(filter);
    //                         });
    //                       },
    //                       onSelected: (bool selected) {
    //                         setState(() {
    //                           if (selected) {
    //                             filters.remove(filter);
    //                           }
    //                         });
    //                       },
    //                     ))
    //                 .toList(),
    //           ),
    //           SizedBox(height: 16.0),
    //           ElevatedButton(
    //             onPressed: _openFilterDialog,
    //             child: Text('Open Filter Dialog'),
    //           ),
    //           SizedBox(height: 16.0),
    //           // Product catalog section
    //           Text(
    //             'Каталог товаров',
    //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //           SizedBox(height: 8.0),
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: Image.asset(
    //                     'assets/dog_food.png'), // Update with actual asset paths
    //               ),
    //               Expanded(
    //                 child: Image.asset(
    //                     'assets/cat_food.png'), // Update with actual asset paths
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 16.0),
    //           // Location section
    //           Text(
    //             'Abuja Nigeria',
    //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //           SizedBox(height: 8.0),
    //           // Product cards
    //           Wrap(
    //             spacing: 8.0,
    //             runSpacing: 8.0,
    //             children: [
    //               ProductCard(
    //                 name: 'Brook',
    //                 imagePath:
    //                     'assets/dog1.png', // Update with actual asset paths
    //                 distance: '1.2 Km Away',
    //               ),
    //               ProductCard(
    //                 name: 'Thomas Shelby',
    //                 imagePath:
    //                     'assets/cat1.png', // Update with actual asset paths
    //                 distance: 'Ultora (2km)',
    //               ),
    //               ProductCard(
    //                 name: 'Moni Charlie',
    //                 imagePath:
    //                     'assets/cat2.png', // Update with actual asset paths
    //                 distance: 'Distance (Near 4km)',
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String distance;

  ProductCard(
      {required this.name, required this.imagePath, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 4.0),
                  Text(distance, style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.favorite_border, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  final String selectedSortBy;
  final double selectedRating;
  final RangeValues selectedPriceRange;
  final Function(String, double, RangeValues) onApplyFilters;

  FilterDialog({
    required this.selectedSortBy,
    required this.selectedRating,
    required this.selectedPriceRange,
    required this.onApplyFilters,
  });

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late String _sortBy;
  late double _rating;
  late RangeValues _priceRange;

  @override
  void initState() {
    super.initState();
    _sortBy = widget.selectedSortBy;
    _rating = widget.selectedRating;
    _priceRange = widget.selectedPriceRange;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Rating filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rating'),
                DropdownButton<double>(
                  value: _rating,
                  items: [4.0, 4.5, 5.0]
                      .map((rating) => DropdownMenuItem(
                            child: Text(rating.toString()),
                            value: rating,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _rating = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Sort by filter
            Text('Sort By'),
            Wrap(
              spacing: 8.0,
              children: [
                'Popularity',
                'Newest',
                'Oldest',
                'High Price',
                'Low Price',
                'Review'
              ]
                  .map((sortBy) => ChoiceChip(
                        label: Text(sortBy),
                        selected: _sortBy == sortBy,
                        onSelected: (selected) {
                          setState(() {
                            _sortBy = sortBy;
                          });
                        },
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            // Price range filter
            Text('Price Range'),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                '\$${_priceRange.start.round()}',
                '\$${_priceRange.end.round()}',
              ),
              onChanged: (values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onApplyFilters(_sortBy, _rating, _priceRange);
            Navigator.of(context).pop();
          },
          child: Text('Apply filters'),
        ),
      ],
    );
  }
}
