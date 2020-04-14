import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';

retailListEntityEntityFromJson(
    RetailListEntityEntity data, Map<String, dynamic> json) {
  if (json['code'] != null) {
    data.code = json['code']?.toInt();
  }
  if (json['msg'] != null) {
    data.msg = json['msg']?.toString();
  }
  if (json['data'] != null) {
    data.data = new RetailListEntityData().fromJson(json['data']);
  }
  return data;
}

Map<String, dynamic> retailListEntityEntityToJson(
    RetailListEntityEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  if (entity.data != null) {
    data['data'] = entity.data.toJson();
  }
  return data;
}

retailListEntityDataFromJson(
    RetailListEntityData data, Map<String, dynamic> json) {
  if (json['order'] != null) {
    data.order = json['order']?.toInt();
  }
  if (json['last_value'] != null) {
    data.lastValue = json['last_value']?.toInt();
  }
  if (json['non_last_value'] != null) {
    data.nonLastValue = json['non_last_value']?.toInt();
  }
  if (json['page'] != null) {
    data.page = json['page']?.toInt();
  }
  if (json['non_page'] != null) {
    data.nonPage = json['non_page']?.toInt();
  }
  if (json['is_data'] != null) {
    data.isData = json['is_data']?.toInt();
  }
  if (json['shop_list'] != null) {
    data.shopList = new List<RetailListEntityDataShopList>();
    (json['shop_list'] as List).forEach((v) {
      data.shopList.add(new RetailListEntityDataShopList().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> retailListEntityDataToJson(RetailListEntityData entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['order'] = entity.order;
  data['last_value'] = entity.lastValue;
  data['non_last_value'] = entity.nonLastValue;
  data['page'] = entity.page;
  data['non_page'] = entity.nonPage;
  data['is_data'] = entity.isData;
  if (entity.shopList != null) {
    data['shop_list'] = entity.shopList.map((v) => v.toJson()).toList();
  }
  return data;
}

retailListEntityDataShopListFromJson(
    RetailListEntityDataShopList data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['shop_sub_id'] != null) {
    data.shopSubId = json['shop_sub_id']?.toString();
  }
  if (json['uid'] != null) {
    data.uid = json['uid']?.toString();
  }
  if (json['shop_name'] != null) {
    data.shopName = json['shop_name']?.toString();
  }
  if (json['delivery_cost'] != null) {
    data.deliveryCost = json['delivery_cost']?.toInt();
  }
  if (json['start_delivery_price'] != null) {
    data.startDeliveryPrice = json['start_delivery_price']?.toInt();
  }
  if (json['service_start_time'] != null) {
    data.serviceStartTime = json['service_start_time']?.toString();
  }
  if (json['service_end_time'] != null) {
    data.serviceEndTime = json['service_end_time']?.toString();
  }
  if (json['is_across_day'] != null) {
    data.isAcrossDay = json['is_across_day']?.toString();
  }
  if (json['delivery_type'] != null) {
    data.deliveryType = json['delivery_type']?.toString();
  }
  if (json['home_id'] != null) {
    data.homeId = json['home_id']?.toString();
  }
  if (json['lng'] != null) {
    data.lng = json['lng']?.toString();
  }
  if (json['lat'] != null) {
    data.lat = json['lat']?.toString();
  }
  if (json['month_sales'] != null) {
    data.monthSales = json['month_sales']?.toString();
  }
  if (json['service_range'] != null) {
    data.serviceRange = json['service_range']?.toString();
  }
  if (json['goods_number'] != null) {
    data.goodsNumber = json['goods_number']?.toString();
  }
  if (json['logo_img'] != null) {
    data.logoImg = json['logo_img']?.toString();
  }
  if (json['shop_date'] != null) {
    data.shopDate = json['shop_date']?.toString();
  }
  if (json['shop_time'] != null) {
    data.shopTime = json['shop_time']?.toString();
  }
  if (json['distance'] != null) {
    data.distance = json['distance']?.toString();
  }
  if (json['cart_num'] != null) {
    data.cartNum = json['cart_num']?.toInt();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toString();
  }
  if (json['res_time'] != null) {
    data.resTime = json['res_time'];
  }
  if (json['shop_logo'] != null) {
    data.shopLogo = json['shop_logo']?.toString();
  }
  if (json['is_vip'] != null) {
    data.isVip = json['is_vip']?.toInt();
  }
  if (json['need_time'] != null) {
    data.needTime = json['need_time']?.toInt();
  }
  if (json['has_goods'] != null) {
    data.hasGoods = json['has_goods']?.toString();
  }
  if (json['activity'] != null) {
    data.activity = new List<RetailListEntityDataShopListActivity>();
    (json['activity'] as List).forEach((v) {
      data.activity.add(new RetailListEntityDataShopListActivity().fromJson(v));
    });
  }
  if (json['goods_list'] != null) {
    data.goodsList = new List<RetailListEntityDataShopListGoodsList>();
    (json['goods_list'] as List).forEach((v) {
      data.goodsList
          .add(new RetailListEntityDataShopListGoodsList().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> retailListEntityDataShopListToJson(
    RetailListEntityDataShopList entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['shop_sub_id'] = entity.shopSubId;
  data['uid'] = entity.uid;
  data['shop_name'] = entity.shopName;
  data['delivery_cost'] = entity.deliveryCost;
  data['start_delivery_price'] = entity.startDeliveryPrice;
  data['service_start_time'] = entity.serviceStartTime;
  data['service_end_time'] = entity.serviceEndTime;
  data['is_across_day'] = entity.isAcrossDay;
  data['delivery_type'] = entity.deliveryType;
  data['home_id'] = entity.homeId;
  data['lng'] = entity.lng;
  data['lat'] = entity.lat;
  data['month_sales'] = entity.monthSales;
  data['service_range'] = entity.serviceRange;
  data['goods_number'] = entity.goodsNumber;
  data['logo_img'] = entity.logoImg;
  data['shop_date'] = entity.shopDate;
  data['shop_time'] = entity.shopTime;
  data['distance'] = entity.distance;
  data['cart_num'] = entity.cartNum;
  data['type'] = entity.type;
  data['res_time'] = entity.resTime;
  data['shop_logo'] = entity.shopLogo;
  data['is_vip'] = entity.isVip;
  data['need_time'] = entity.needTime;
  data['has_goods'] = entity.hasGoods;
  if (entity.activity != null) {
    data['activity'] = entity.activity.map((v) => v.toJson()).toList();
  }
  if (entity.goodsList != null) {
    data['goods_list'] = entity.goodsList.map((v) => v.toJson()).toList();
  }
  return data;
}

retailListEntityDataShopListActivityFromJson(
    RetailListEntityDataShopListActivity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['total_price'] != null) {
    data.totalPrice = json['total_price']?.toString();
  }
  if (json['discount_price'] != null) {
    data.discountPrice = json['discount_price']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  return data;
}

Map<String, dynamic> retailListEntityDataShopListActivityToJson(
    RetailListEntityDataShopListActivity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['total_price'] = entity.totalPrice;
  data['discount_price'] = entity.discountPrice;
  data['name'] = entity.name;
  return data;
}

retailListEntityDataShopListGoodsListFromJson(
    RetailListEntityDataShopListGoodsList data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['cid'] != null) {
    data.cid = json['cid']?.toString();
  }
  if (json['cashier_id'] != null) {
    data.cashierId = json['cashier_id']?.toString();
  }
  if (json['shop_sub_id'] != null) {
    data.shopSubId = json['shop_sub_id']?.toString();
  }
  if (json['goods_name'] != null) {
    data.goodsName = json['goods_name']?.toString();
  }
  if (json['goods_code'] != null) {
    data.goodsCode = json['goods_code']?.toString();
  }
  if (json['goods_desc'] != null) {
    data.goodsDesc = json['goods_desc']?.toString();
  }
  if (json['price'] != null) {
    data.price = json['price']?.toInt();
  }
  if (json['vip_price'] != null) {
    data.vipPrice = json['vip_price']?.toInt();
  }
  if (json['picture'] != null) {
    data.picture = json['picture']?.toString();
  }
  if (json['picture_detail'] != null) {
    data.pictureDetail = json['picture_detail']?.toString();
  }
  if (json['status'] != null) {
    data.status = json['status']?.toString();
  }
  if (json['discount_rate'] != null) {
    data.discountRate = json['discount_rate']?.toString();
  }
  if (json['sellout_status'] != null) {
    data.selloutStatus = json['sellout_status']?.toString();
  }
  if (json['month_sale'] != null) {
    data.monthSale = json['month_sale']?.toString();
  }
  if (json['rate_status'] != null) {
    data.rateStatus = json['rate_status']?.toInt();
  }
  if (json['final_discount'] != null) {
    data.finalDiscount = json['final_discount']?.toString();
  }
  if (json['show_discount'] != null) {
    data.showDiscount = json['show_discount']?.toString();
  }
  if (json['final_price'] != null) {
    data.finalPrice = json['final_price']?.toInt();
  }
  if (json['month_sales'] != null) {
    data.monthSales = json['month_sales']?.toString();
  }
  return data;
}

Map<String, dynamic> retailListEntityDataShopListGoodsListToJson(
    RetailListEntityDataShopListGoodsList entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['cid'] = entity.cid;
  data['cashier_id'] = entity.cashierId;
  data['shop_sub_id'] = entity.shopSubId;
  data['goods_name'] = entity.goodsName;
  data['goods_code'] = entity.goodsCode;
  data['goods_desc'] = entity.goodsDesc;
  data['price'] = entity.price;
  data['vip_price'] = entity.vipPrice;
  data['picture'] = entity.picture;
  data['picture_detail'] = entity.pictureDetail;
  data['status'] = entity.status;
  data['discount_rate'] = entity.discountRate;
  data['sellout_status'] = entity.selloutStatus;
  data['month_sale'] = entity.monthSale;
  data['rate_status'] = entity.rateStatus;
  data['final_discount'] = entity.finalDiscount;
  data['show_discount'] = entity.showDiscount;
  data['final_price'] = entity.finalPrice;
  data['month_sales'] = entity.monthSales;
  return data;
}
