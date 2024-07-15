import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            OrderCard(
              shopName: 'Puppy Pet Shop',
              orderNumber: '#00000885352',
              orderTime: '2024-05-12 21:04:43',
              paymentStatus: 'CHƯA THANH TOÁN',
              productDescription:
                  'XKM diệt khuẩn Prunus Lavender Bacteres 700ml (1), Hạt Today\'s Dinner 1kg dành cho chó trưởng thành...',
              totalItems: 4,
              totalPrice: 890000,
              deliveryStatus: 'Đơn vị vận chuyển lấy hàng thành công',
              isDelivered: false,
            ),
            OrderCard(
              shopName: 'Puppy Pet Shop',
              orderNumber: '#00000885352',
              orderTime: '2024-05-12 21:04:43',
              paymentStatus: 'CHƯA THANH TOÁN',
              productDescription:
                  'XKM diệt khuẩn Prunus Lavender Bacteres 700ml (1), Hạt Today\'s Dinner 1kg dành cho chó trưởng thành...',
              totalItems: 4,
              totalPrice: 890000,
              deliveryStatus: 'Đơn vị vận chuyển lấy hàng thành công',
              isDelivered: true,
            ),
            OrderCard(
              shopName: 'Puppy Pet Shop',
              orderNumber: '#00000885352',
              orderTime: '2024-05-12 21:04:43',
              paymentStatus: 'CHƯA THANH TOÁN',
              productDescription:
                  'XKM diệt khuẩn Prunus Lavender Bacteres 700ml (1), Hạt Today\'s Dinner 1kg dành cho chó trưởng thành...',
              totalItems: 4,
              totalPrice: 890000,
              deliveryStatus: 'Đơn vị vận chuyển lấy hàng thành công',
              isDelivered: false,
            ),
            OrderCard(
              shopName: 'Puppy Pet Shop',
              orderNumber: '#00000885352',
              orderTime: '2024-05-12 21:04:43',
              paymentStatus: 'CHƯA THANH TOÁN',
              productDescription:
                  'XKM diệt khuẩn Prunus Lavender Bacteres 700ml (1), Hạt Today\'s Dinner 1kg dành cho chó trưởng thành...',
              totalItems: 4,
              totalPrice: 890000,
              deliveryStatus: 'Đơn vị vận chuyển lấy hàng thành công',
              isDelivered: false,
            ),
            OrderCard(
              shopName: 'Puppy Pet Shop',
              orderNumber: '#00000885352',
              orderTime: '2024-05-12 21:04:43',
              paymentStatus: 'CHƯA THANH TOÁN',
              productDescription:
                  'XKM diệt khuẩn Prunus Lavender Bacteres 700ml (1), Hạt Today\'s Dinner 1kg dành cho chó trưởng thành...',
              totalItems: 4,
              totalPrice: 890000,
              deliveryStatus: 'Đơn vị vận chuyển lấy hàng thành công',
              isDelivered: false,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String shopName;
  final String orderNumber;
  final String orderTime;
  final String paymentStatus;
  final String productDescription;
  final int totalItems;
  final int totalPrice;
  final String deliveryStatus;
  final bool isDelivered;

  OrderCard({
    required this.shopName,
    required this.orderNumber,
    required this.orderTime,
    required this.paymentStatus,
    required this.productDescription,
    required this.totalItems,
    required this.totalPrice,
    required this.deliveryStatus,
    required this.isDelivered,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/your_shop_image.png'),
                  radius: 16,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(shopName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('1', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('ĐƠN HÀNG',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Text('Giỏ hàng', style: TextStyle(color: Colors.green)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(orderNumber,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Text(orderTime, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 30),
                  ),
                  child: Text('Cửa hàng'),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child:
                  Text(paymentStatus, style: TextStyle(color: Colors.orange)),
            ),
            SizedBox(height: 8),
            Text(productDescription),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$totalItems sản phẩm'),
                Text('Tổng thanh toán: ${totalPrice.toStringAsFixed(0)}đ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.green),
                SizedBox(width: 8),
                Text(deliveryStatus, style: TextStyle(color: Colors.green)),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
            SizedBox(height: 8),
            Text(
                'Vui lòng chỉ nhấn "Đã nhận được hàng" khi đơn hàng đã được giao đến bạn và sản phẩm nhận được không có vấn đề nào.',
                style: TextStyle(color: Colors.grey)),
            ElevatedButton(
              onPressed: isDelivered ? null : () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
              ),
              child: Text('Đã nhận được hàng'),
            ),
          ],
        ),
      ),
    );
  }
}
