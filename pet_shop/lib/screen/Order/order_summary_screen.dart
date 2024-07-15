import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Order Summary'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressSection(),
              SizedBox(height: 16),
              NotesSection(),
              SizedBox(height: 16),
              SelectedItemsSection(),
              SizedBox(height: 16),
              SummarySection(),
              SizedBox(height: 16),
              VoucherSection(),
              SizedBox(height: 16),
              ContinueButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 8),
              Text('Địa chỉ giao hàng',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text(
                'Thay đổi',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Abcdefg Hkglmn'),
          Text('84906536176'),
          Text(
              '27/37/4 Đ. Thống Nhất (Phường 16, Quận Gò Vấp, Thành phố Hồ Chí Minh)'),
        ],
      ),
    );
  }
}

class NotesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text('Ghi chú (Thời gian giao hàng, ghi chú khác)'),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Nhập ghi chú của bạn tại đây',
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedItemsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mặt hàng đã chọn',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ItemCard(
            imagePath: 'assets/images/_project/Products/food_1.jpg',
            title: 'Hạt Me-O Adult cho mèo trưởng thành 1.2kg',
            price: '115.000đ',
          ),
          ItemCard(
            imagePath: 'assets/images/_project/Products/food_2.jpg',
            title: 'Hạt Royal Canin Urinary S/O hỗ trợ tiết niệu cho mèo 1.5kg',
            price: '470.000đ',
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  ItemCard({required this.imagePath, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 60, height: 60),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text(price, style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SummarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryRow(
            title: 'Tổng tiền hàng',
            value: '890.000đ',
          ),
          SummaryRow(
            title: 'Tiền thuế',
            value: '890.000đ',
          ),
          SummaryRow(
            title: 'Phí vận chuyển',
            value: 'Chưa tính',
            valueColor: Colors.red,
          ),
          Divider(color: Colors.grey),
          SummaryRow(
            title: 'Tổng thanh toán (4 sản phẩm)',
            value: '890.000đ',
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color? valueColor;

  SummaryRow({
    required this.title,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class VoucherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: Text('Chọn Voucher'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text('Chọn hoặc nhập mã'),
          ),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'TIẾP TỤC',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
