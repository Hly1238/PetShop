// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:pet_shop/config/constant.dart';
// import 'package:pet_shop/models/Order/order.dart';
// import 'package:pet_shop/models/Order/product_order.dart';
// import 'package:pet_shop/models/Product/product.dart';

// class OrderDetailsScreen extends StatelessWidget {
//   final Order item;
//   const OrderDetailsScreen({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(),
//         title: Text('Thông tin đơn hàng'),
//       ),
//       backgroundColor: CustomAppColor.lightBackgroundColor_Home,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             OrderInfoSection(
//               item: item,
//             ),
//             SizedBox(height: 16),
//             ShippingInfoSection(
//               order: item,
//             ),
//             SizedBox(height: 16),
//             // AddressInfoSection(),
//             // SizedBox(height: 16),
//             SelectedItemsSection(items: item.products),
//             SizedBox(height: 16),
//             TotalAmountSection(total: item.orderTotal),
//             SizedBox(height: 16),
//             // PaymentMethodSection(billing: item.billing),
//             SizedBox(height: 16),
//             OrderSummarySection(
//               order: item,
//             ),
//             // SizedBox(height: 16),
//             // ActionButtons(),
//           ],
//         ),
//       ),
//       // bottomNavigationBar: BottomAppBar(
//       //   child: Padding(
//       //     padding: const EdgeInsets.all(16.0),
//       //     child: ElevatedButton(
//       //       onPressed: () {
//       //         // Handle mua lại action
//       //       },
//       //       style: ElevatedButton.styleFrom(
//       //         padding: EdgeInsets.symmetric(vertical: 16.0),
//       //       ),
//       //       child: Text('Mua lại'),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }

// class OrderInfoSection extends StatelessWidget {
//   final Order item;

//   const OrderInfoSection({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mã đơn hàng: ${item.id}',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Row(
//             children: [
//               Text('Trạng thái: '),
//               Text(
//                 '${item.status}',
//                 style: TextStyle(color: Colors.green),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Row(
//             children: [
//               item.status != "final"
//                   ? Text('CHƯA THANH TOÁN')
//                   : Text('ĐÃ GIAO'),
//               Spacer(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ShippingInfoSection extends StatelessWidget {
//   final Order order;

//   const ShippingInfoSection({super.key, required this.order});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Thông tin vận chuyển',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text('${order.address}'),
//           SizedBox(height: 8),
//         ],
//       ),
//     );
//   }
// }

// class AddressInfoSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Địa chỉ giao hàng',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text('Haley'),
//           SizedBox(height: 8),
//           Text('84906536176'),
//           SizedBox(height: 8),
//           Text(
//               '27/37/4 Đ. Thống Nhất (Phường 16, Quận Gò Vấp, Thành phố Hồ Chí Minh)'),
//           SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               // Handle thay đổi action
//             },
//             child: Text('Thay đổi'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SelectedItemsSection extends StatelessWidget {
//   final List<ProductOrder> items;

//   const SelectedItemsSection({super.key, required this.items});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mặt hàng đã chọn',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Column(
//             children: [
//               Column(
//                 children: items
//                     .map(
//                       (item) => ItemRow(
//                         imageUrl: item.product.image,
//                         title: item.product.name,
//                         price: '${item.product.promotion}',
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ItemRow extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String price;

//   const ItemRow({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.asset(
//           // imageUrl,
//           "assets/images/_project/Products/food_2.jpg",
//           width: 60,
//           height: 60,
//           fit: BoxFit.cover,
//         ),
//         SizedBox(width: 8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title),
//               Text(
//                 price,
//                 style: TextStyle(color: Colors.red),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TotalAmountSection extends StatelessWidget {
//   final double total;

//   const TotalAmountSection({super.key, required this.total});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Thành tiền', style: TextStyle(fontWeight: FontWeight.bold)),
//               Text('$total'),
//             ],
//           ),
//           SizedBox(height: 8),
//           // Text('Vui lòng thanh toán ₫40.660 khi nhận hàng.'),
//         ],
//       ),
//     );
//   }
// }

// class PaymentMethodSection extends StatelessWidget {
//   final String billing;

//   const PaymentMethodSection({super.key, required this.billing});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Phương thức thanh toán',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text('$billing'),
//         ],
//       ),
//     );
//   }
// }

// class OrderSummarySection extends StatelessWidget {
//   final Order order;

//   const OrderSummarySection({super.key, required this.order});
//   @override
//   Widget build(BuildContext context) {
//     String formattedDate = DateFormat('dd/MM/yyyy').format(order.date);

//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mã đơn hàng: ${order.id}',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           Text('Thời gian cật nhật: $formattedDate'),
//         ],
//       ),
//     );
//   }
// }

// class ActionButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: OutlinedButton(
//             onPressed: () {
//               // Handle liên hệ shop action
//             },
//             child: Text('Liên hệ Shop'),
//           ),
//         ),
//         SizedBox(width: 8),
//         Expanded(
//           child: OutlinedButton(
//             onPressed: () {
//               // Handle xem đánh giá action
//             },
//             child: Text('Xem Đánh Giá'),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/models/Order/order.dart';
import 'package:pet_shop/models/Order/product_order.dart';
import 'package:pet_shop/models/Product/product.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order item;
  const OrderDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Thông tin đơn hàng'),
      ),
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderInfoSection(
              item: item,
            ),
            SizedBox(height: 16),
            // ShippingInfoSection(
            //   order: item,
            // ),
            SizedBox(height: 16),
            AddressInfoSection(),
            SizedBox(height: 16),
            SelectedItemsSection(items: item.products),
            SizedBox(height: 16),
            TotalAmountSection(total: item.orderTotal),
            SizedBox(height: 16),
            // PaymentMethodSection(billing: item.billing),
            SizedBox(height: 16),
            // OrderSummarySection(
            //   order: item,
            // ),
            // SizedBox(height: 16),
            // ActionButtons(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: ElevatedButton(
      //       onPressed: () {
      //         // Handle mua lại action
      //       },
      //       style: ElevatedButton.styleFrom(
      //         padding: EdgeInsets.symmetric(vertical: 16.0),
      //       ),
      //       child: Text('Mua lại'),
      //     ),
      //   ),
      // ),
    );
  }
}

class OrderInfoSection extends StatelessWidget {
  final Order item;

  const OrderInfoSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mã đơn hàng: ${item.id}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Trạng thái: '),
              Text(
                '${item.status}',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              item.status != "final"
                  ? Text('CHƯA THANH TOÁN')
                  : Text('ĐÃ GIAO'),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class ShippingInfoSection extends StatelessWidget {
  final Order order;

  const ShippingInfoSection({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin vận chuyển',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('${order.address}'),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AddressInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Địa chỉ giao hàng',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Haley'),
              SizedBox(height: 8),
              Text('84906536176'),
              SizedBox(height: 8),
              Text(
                  '27/37/4 Đ. Thống Nhất (Phường 16, Quận Gò Vấp, Thành phố Hồ Chí Minh)'),
              SizedBox(height: 8),
              // ElevatedButton(
              //   onPressed: () {
              //     // Handle thay đổi action
              //   },
              //   child: Text('Thay đổi'),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class SelectedItemsSection extends StatelessWidget {
  final List<ProductOrder> items;

  const SelectedItemsSection({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mặt hàng đã chọn',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            children: [
              Column(
                children: items
                    .map(
                      (item) => ItemRow(
                        imageUrl: item.product.image,
                        title: item.product.name,
                        price: '${item.product.promotion}',
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ItemRow({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          // imageUrl,
          "assets/images/_project/Products/food_2.jpg",
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                price,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TotalAmountSection extends StatelessWidget {
  final double total;

  const TotalAmountSection({super.key, required this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thành tiền', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('$total'),
            ],
          ),
          SizedBox(height: 8),
          // Text('Vui lòng thanh toán ₫40.660 khi nhận hàng.'),
        ],
      ),
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  final String billing;

  const PaymentMethodSection({super.key, required this.billing});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phương thức thanh toán',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(billing),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class OrderSummarySection extends StatelessWidget {
  final Order order;

  const OrderSummarySection({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('UserId: ${order.id}'),
          SizedBox(height: 8),
          Text('Order Total: ${order.orderTotal}'),
          SizedBox(height: 8),
          Text('Address: ${order.address}'),
          SizedBox(height: 8),
          Text('Status: ${order.status}'),
          SizedBox(height: 8),
          Text('Description: ${order.description}'),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
