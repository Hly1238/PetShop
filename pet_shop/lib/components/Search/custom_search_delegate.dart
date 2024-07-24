// import 'package:flutter/material.dart';
// import 'package:pet_shop/controllers/Home/home_controller.dart';
// import 'package:pet_shop/models/Product/category.dart';
// import 'package:pet_shop/models/Product/product.dart';

// class CustomSearchDelegate extends SearchDelegate<String> {
//   final String id;
//   List<Product> items;
//   List<Category> categories;

//   CustomSearchDelegate({
//     required this.id,
//     List<Product>? items,
//     List<Category>? categories,
//   })  : items = items ?? [],
//         categories = categories ?? [];

//   List<String> searchAndFilter(String query) {
//     if (query.isEmpty || items.isEmpty || categories.isEmpty) return [];

//     List<String> results = [];

//     // Tìm kiếm trong danh sách sản phẩm
//     results.addAll(
//       items
//           .where(
//               (item) => item.name.toLowerCase().contains(query.toLowerCase()))
//           .map((item) => item.name)
//           .toList(),
//     );

//     // Tìm kiếm trong danh sách thể loại
//     results.addAll(
//       categories
//           .where((category) =>
//               category.name.toLowerCase().contains(query.toLowerCase()))
//           .map((category) => category.name)
//           .toList(),
//     );

//     return results;
//   }

//   String? getIdFromName(String name) {
//     for (var product in items) {
//       if (product.name == name) {
//         return product.id; // Thay .name thành .id
//       }
//     }

//     // Tìm ID trong danh sách thể loại
//     for (var category in categories) {
//       if (category.name == name) {
//         return category.id; // Thay .name thành .id
//       }
//     }

//     return null;
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//           showSuggestions(context);
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, '');
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (items.isEmpty) {
//       items = HomeController.instance.productList;
//     }
//     if (categories.isEmpty) {
//       categories = HomeController.instance.categoryList;
//     }

//     final results = searchAndFilter(query);
//     if (results.isEmpty) {
//       return Center(
//         child: Text('No results found'),
//       );
//     }
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         final item = results[index];
//         return ListTile(
//           title: Text(item),
//           onTap: () {
//             final id = getIdFromName(item);
//             if (id != null) {
//               print('Selected: $item, ID: $id');
//             }
//             query = item;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (items.isEmpty) {
//       items = HomeController.instance.productList;
//     }
//     if (categories.isEmpty) {
//       categories = HomeController.instance.categoryList;
//     }

//     final results = searchAndFilter(query);
//     if (results.isEmpty) {
//       return Center(
//         child: Text('No suggestions available'),
//       );
//     }
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         final item = results[index];
//         return ListTile(
//           title: Text(item),
//           onTap: () {
//             final id = getIdFromName(item);
//             if (id != null) {
//               print('Selected: $item, ID: $id');
//             }
//             query = item;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_shop/controllers/Home/home_controller.dart';
import 'package:pet_shop/controllers/Product/product_controller.dart';
import 'package:pet_shop/models/Product/category.dart';
import 'package:pet_shop/models/Product/product.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/screen/Home/components/selection_component/selection_title.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final String id;
  List<Product> items;
  List<Category> categories;

  CustomSearchDelegate({
    required this.id,
    List<Product>? items,
    List<Category>? categories,
  })  : items = items ?? [],
        categories = categories ?? [];

  List<String> searchAndFilter(String query) {
    if (query.isEmpty || items.isEmpty || categories.isEmpty) return [];

    List<String> results = [];

    // Tìm kiếm trong danh sách sản phẩm
    results.addAll(
      items
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .map((item) => item.name)
          .toList(),
    );

    // Tìm kiếm trong danh sách thể loại
    results.addAll(
      categories
          .where((category) =>
              category.name.toLowerCase().contains(query.toLowerCase()))
          .map((category) => category.name)
          .toList(),
    );

    return results;
  }

  String? getIdFromName(String name) {
    for (var product in items) {
      if (product.name == name) {
        return product.id; // Thay .name thành .id
      }
    }

    // Tìm ID trong danh sách thể loại
    for (var category in categories) {
      if (category.name == name) {
        return category.id; // Thay .name thành .id
      }
    }

    return null;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {
          Fluttertoast.showToast(
            msg: 'You searched for: $query',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // @override
  // Widget buildResults(BuildContext context) {
  //   if (query.isEmpty) {
  //     return Center(
  //       child: Text('Please enter a search term'),
  //     );
  //   }
  //   Navigator.of(context).pushReplacementNamed(Routes.product_category,
  //       arguments: SelectionTitleArguments(name: query, productList: []));
  //   Fluttertoast.showToast(
  //     msg: 'You searched for: $query',
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //   );

  //   return Center(
  //     child: Text('You searched for: $query'),
  //   );
  // }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Please enter a search term'),
      );
    }

    // Delay the navigation until after the build process
    Future.microtask(() async {
      await ProductController.instance.getProductByName(query);
      Navigator.of(context).pushReplacementNamed(
        Routes.product_category,
        arguments: SelectionTitleArguments(
            name: query,
            productList: ProductController.instance.productListSearch),
      );
      Fluttertoast.showToast(
        msg: 'You searched for: $query',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    });

    return Center(
      child: Text('You searched for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (items.isEmpty) {
      items = HomeController.instance.productList;
    }
    if (categories.isEmpty) {
      categories = HomeController.instance.categoryList;
    }

    final results = searchAndFilter(query);
    if (results.isEmpty) {
      return Center(
        child: Text('No suggestions available'),
      );
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          title: Text(item),
          onTap: () {
            query = item;
            showResults(context);
          },
        );
      },
    );
  }
}
