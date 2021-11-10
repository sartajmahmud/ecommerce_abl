import 'package:grocery_app/models/ProductOrder.dart';
import '../helpers/custom_trace.dart';
import '../models/address.dart';
import '../models/user.dart';
import 'OrderStatus.dart';
import 'Payment.dart';

class Order {
  String id;
  List<ProductOrder> productOrders;
  OrderStatus orderStatus;
  // double tax;
  double deliveryFee;
  String hint;
  bool active;
  DateTime dateTime;
  User user;
  Payment payment;
  Address deliveryAddress;
  double latitude;
  double longitude;
  // Coupon coupon;
  String deliveryAddressName;

  Order();

  Order.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id']!=null ? jsonMap['id'].toString() : '';
      //     tax = jsonMap['tax'] != null ? jsonMap['tax'].toDouble() : 0.0;
      deliveryFee = jsonMap['delivery_fee'] != null ? jsonMap['delivery_fee'].toDouble() : 0.0;
      hint = jsonMap['hint'] != null ? jsonMap['hint'].toString() : '';
      active = jsonMap['active'] ?? false;
      //   latitude=double.parse(jsonMap['latitude'])  != null ? double.parse(jsonMap['latitude'])  : 0.0;
      //cashbackusage=int.parse(jsonMap['cashback_usage'])  != null ? int.parse(jsonMap['cashback_usage'])  : 0;
      //   longitude=double.parse(jsonMap['longitude'])  != null ? double.parse(jsonMap['longitude']) : 0.0;
      orderStatus = jsonMap['order_status'] != null ? OrderStatus.fromJSON(jsonMap['order_status']) : OrderStatus.fromJSON({});
      dateTime = DateTime.parse(jsonMap['updated_at']);
      user = jsonMap['user'] != null ? User.fromJSON(jsonMap['user']) : User.fromJSON({});
      // deliveryAddress = jsonMap['delivery_address'] != null ? Address.fromJSON(jsonMap['delivery_address']) : Address.fromJSON({});
      // payment = jsonMap['payment'] != null ? Payment.fromJSON(jsonMap['payment']) : Payment.fromJSON({});
      productOrders = jsonMap['productOrders'] != null ? List.from(jsonMap['productOrders']).map((element) => ProductOrder.fromJSON(element)).toList() : [];
      // coupon=jsonMap['coupon'] !=null ? Coupon.fromJSON(jsonMap['coupon']) : Coupon.fromJSON({});
      //cashback=jsonMap['cashback_usage'] !=null ? Cashback.fromJSON(jsonMap['cashback_usage']) : Cashback.fromJSON({});
      //disount=double.parse(jsonMap['discount_amount'])  != null ? double.parse(jsonMap['discount_amount']) : 0.0;
    } catch (e) {
      id = '';
      //    tax = 0.0;
      deliveryFee = 0.0;
      longitude=0.0;
      latitude=0.0;
      //cashbackusage=0;
      //disount=0.0;
      hint = '';
      active = false;
      orderStatus = OrderStatus.fromJSON({});
      dateTime = DateTime(0);
      user = User.fromJSON({});
      //    payment = Payment.fromJSON({});
      deliveryAddress = Address.fromJSON({});
      //cashback=Cashback.fromJSON({});
      productOrders = [];
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["user_id"] = user?.id;
    map["order_status_id"] = orderStatus?.id;
    //  map["tax"] = tax;
    if(latitude==null)
    {
      latitude=0.0;
    }
    if(longitude==null){
      longitude=0.0;
    }
    // if(couponCode!=null){
    //   map['coupon_code']=couponCode;
    // }
    // if(cashbackusage==null)
    // {
    //   cashbackusage=0;
    // }
    // if(offerId!=null)
    // {
    //   map['offer_id']=offerId;
    // }
    // if(disount!=null){
    //   map['discount_amount']=disount.toInt().toString();
    // }
    // map["cashback_usage"]=cashbackusage;
    map["latitude"]=latitude.toString();
    map["longitude"]=longitude.toString();
    map['delivery_address']=deliveryAddressName;
    map['hint'] = hint;
    map["delivery_fee"] = deliveryFee.toInt();
    map["products"] = productOrders?.map((element) => element.toMap())?.toList();
    map["payment"] = payment?.toMap();
    if (!deliveryAddress.isUnknown()) {
      map["delivery_address_id"] = deliveryAddress?.id;
    }
    return map;
  }

  Map cancelMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    if (orderStatus?.id != null && orderStatus?.id == '1') map["active"] = false;
    return map;
  }

  bool canCancelOrder() {
    return this.active == true && this.orderStatus.id == '1'; // 1 for order received status
  }
}
