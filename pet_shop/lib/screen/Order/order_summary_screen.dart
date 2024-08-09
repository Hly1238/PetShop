import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_shop/config/constant.dart';
import 'package:pet_shop/config/secure_storage/security_storage.dart';
import 'package:pet_shop/config/snack_bar_inform/snackbar_custom.dart';
import 'package:pet_shop/config/validators/transform.dart';
import 'package:pet_shop/controllers/Order/order_controller.dart';
import 'package:pet_shop/models/Order/order.dart';
import 'package:pet_shop/models/Order/product_order.dart';
import 'package:pet_shop/payment/flutter_zalopay_sdk.dart';
import 'package:pet_shop/payment/repo/payment.dart';
import 'package:pet_shop/route/route_generator.dart';
import 'package:pet_shop/servies/Order/order_service.dart';

class OrderSummaryScreen extends StatefulWidget {
  final List<ProductOrder> selectedItems;

  const OrderSummaryScreen({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  String address = "";
  String name = "";
  String phone = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAddress();
    fetchData();
  }

  Future<void> fetchAddress() async {
    String fetchedAddress = await OrderController.instance.findLastestAddress();
    setState(() {
      address = fetchedAddress;
      isLoading = false;
    });
  }

  Future<void> fetchData() async {
    String fetchedPhone = await SecurityStorage().getSecureData("phone");
    String fetchedName = await SecurityStorage().getSecureData("username");
    setState(() {
      phone = fetchedPhone;
      name = fetchedName;
      isLoading = false;
    });
  }

  int calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in widget.selectedItems) {
      double itemTotal = item.product.promotion * item.quantity;
      totalPrice += itemTotal;
    }
    return totalPrice.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.lightBackgroundColor_Home,
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Order Summary'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddressSection(
                      address: address,
                      onChange: (newAddress) {
                        setState(() {
                          address = newAddress;
                        });
                      },
                      phone: phone,
                      name: name,
                    ),
                    SizedBox(height: 16),
                    // NotesSection(),
                    // SizedBox(height: 16),
                    SelectedItemsSection(
                      listItemSelected: widget.selectedItems,
                    ),
                    SizedBox(height: 16),
                    SummarySection(
                      total: calculateTotalPrice(),
                      selectedItems: widget.selectedItems,
                    ),
                    SizedBox(height: 16),
                    PaymentMethod(
                      isEnabled: address.isNotEmpty,
                      address: address,
                      selectedItems: widget.selectedItems,
                      billing: 'paypal',
                      status: "approved",
                      description: "",
                      total: calculateTotalPrice(),
                    ),
                    SizedBox(height: 16),
                    ContinueButton(
                      isEnabled: address.isNotEmpty,
                      address: address,
                      selectedItems: widget.selectedItems,
                      billing: 'cod',
                      total: calculateTotalPrice(),
                      status: 'pending',
                      description: '',
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class AddressSection extends StatelessWidget {
  final String address;
  final String phone;
  final String name;
  final Function(String) onChange;

  AddressSection(
      {required this.address,
      required this.onChange,
      required this.phone,
      required this.name});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.local_shipping,
                    size: 20,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Địa chỉ giao hàng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  String newAddress = await showDialog(
                    context: context,
                    builder: (context) =>
                        AddressDialog(currentAddress: address),
                  );
                  if (newAddress.isNotEmpty) {
                    onChange(newAddress);
                  }
                },
                child: Text(
                  'Thay đổi',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(phone, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(address.isEmpty ? "Chưa có địa chỉ" : address,
                    style: TextStyle(color: Colors.black54)),
                SizedBox(height: 8),
              ],
            ),
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     // Handle thay đổi action
          //   },
          //   child: Text('Thay đổi'),
          // ),
        ],
      ),
    );
  }
}

class AddressDialog extends StatefulWidget {
  final String currentAddress;

  AddressDialog({required this.currentAddress});

  @override
  _AddressDialogState createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentAddress);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nhập địa chỉ mới'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Nhập địa chỉ của bạn tại đây'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(""),
          child: Text('Hủy'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text);
          },
          child: Text('Lưu'),
        ),
      ],
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
              Icon(
                Icons.note_alt,
                size: 20,
              ),
              SizedBox(
                width: 7,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text('Ghi chú',
                    softWrap: true,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text("(Thời gian giao hàng, ghi chú khác)"),
          ),
          TextField(
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Nhập ghi chú của bạn tại đây',
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedItemsSection extends StatelessWidget {
  final List<ProductOrder> listItemSelected;

  const SelectedItemsSection({super.key, required this.listItemSelected});

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
              Icon(
                Icons.shopping_cart,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Mặt hàng đã chọn',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 350,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    height: 20,
                  ),
                  Column(
                    children: listItemSelected
                        .map((productOrder) => ItemCard(
                              imagePath: productOrder.product.image,
                              title: productOrder.product.name,
                              price:
                                  '${TransformCustomApp().formatCurrency((productOrder.product.promotion * productOrder.quantity).toInt())}',
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
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
    return Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  imagePath,
                  width: 70,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 30,
            ),
          ],
        ));
  }
}

class SummarySection extends StatelessWidget {
  final int total;
  final List<ProductOrder> selectedItems;
  const SummarySection(
      {super.key, required this.total, required this.selectedItems});
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
            value: '${TransformCustomApp().formatCurrency(total)}',
            isBold: true,
          ),
          // SummaryRow(
          //   title: 'Tiền thuế',
          //   value: '890.000đ',
          // ),
          // SummaryRow(
          //   title: 'Phí vận chuyển',
          //   value: 'Chưa tính',
          //   valueColor: Colors.red,
          //   isBold: true,
          // ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Text(
                " Tổng thanh toán (${selectedItems.length} sản phẩm)",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${TransformCustomApp().formatCurrency(total)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18),
              )
            ],
          )
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
              color: valueColor ?? Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
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
  final bool isEnabled;
  final int total;
  final String address;
  final String billing;
  final String status;
  final String description;
  final List<ProductOrder> selectedItems;
  ContinueButton(
      {required this.isEnabled,
      required this.total,
      required this.address,
      required this.billing,
      required this.selectedItems,
      required this.status,
      required this.description});
  OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled
            ? () async {
                var isSuccess = await createOrder(selectedItems, total, address,
                    billing, status, description);
                if (await isSuccess) {
                  await orderController.getAllStatusOrder();

                  Navigator.of(context).pushReplacementNamed(
                    Routes.order_detail,
                    arguments: orderController.order.value,
                  );
                }
              }
            : () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     SnackbarCustom()
                //         .showErorSnackBar("Vui lòng điền thông tin vận chuyển"));
                EasyLoading.showError("Vui lòng điền thông tin vận chuyển");
              },
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

  Future<bool> createOrder(List<ProductOrder> selectedItems, int total,
      String address, String billing, String status, String description) async {
    var isSuccess = OrderController.instance.createOrder(
        selectedItems, total, address, billing, status, description);
    return isSuccess;
  }
}

class PaymentMethod extends StatelessWidget {
  final bool isEnabled;

  final int total;
  final String address;
  final String billing;
  final String description;
  final String status;
  final List<ProductOrder> selectedItems;

  PaymentMethod(
      {super.key,
      required this.total,
      required this.address,
      required this.billing,
      required this.selectedItems,
      required this.description,
      required this.status,
      required this.isEnabled});
  OrderController orderController = Get.find<OrderController>();

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
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: isEnabled
                      ? () async {
                          var result = await createOrder(total);
                          if (result != null) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackbarCustom()
                            //         .showErorSnackBar("${result.zptranstoken}"));

                            FlutterZaloPaySdk.payOrder(
                                    zpToken: result.zptranstoken)
                                .then((event) {
                              switch (event) {
                                case FlutterZaloPayStatus.cancelled:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackbarCustom().showErorSnackBar(
                                          "User Huỷ Thanh Toán"));
                                  break;
                                case FlutterZaloPayStatus.success:
                                  createPayment(context);
                                  break;
                                case FlutterZaloPayStatus.failed:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackbarCustom().showErorSnackBar(
                                          "Thanh toán thất bại"));

                                  break;
                                default:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackbarCustom().showErorSnackBar(
                                          "Thanh toán thất bại"));
                                  break;
                              }
                            });
                          }
                        }
                      : () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackbarCustom()
                          //         .showErorSnackBar("Vui lòng điền thông tin vận chuyển"));
                          EasyLoading.showError(
                              "Vui lòng điền thông tin vận chuyển");
                        },
                  child: Text('Thanh toán trước bằng ZaloPay'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "(Nếu không chọn thanh toán trước thì khách hàng sẽ thanh toán sau khi nhận được hàng)",
            softWrap: true,
            style: TextStyle(color: Colors.grey, fontSize: 11),
          )
        ],
      ),
    );
  }

  void createPayment(BuildContext context) async {
    bool isOrderCreated = await OrderController.instance.createOrder(
        selectedItems, total, address, billing, status, description);
    if (await isOrderCreated) {
      await orderController.getAllStatusOrder();
      Navigator.of(context).pushReplacementNamed(
        Routes.order_detail,
        arguments: orderController.order.value,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackbarCustom().showErorSnackBar("Tạo đơn hàng thất bại"));
    }
  }
}
