import 'package:fluttercmcanyin/generated/json/base/json_convert_content.dart';
import 'package:fluttercmcanyin/generated/json/base/json_filed.dart';

class RetailListEntityEntity with JsonConvert<RetailListEntityEntity> {
	int code;
	String msg;
	RetailListEntityData data;
}

class RetailListEntityData with JsonConvert<RetailListEntityData> {
	int order;
	@JSONField(name: "last_value")
	int lastValue;
	@JSONField(name: "non_last_value")
	int nonLastValue;
	int page;
	@JSONField(name: "non_page")
	int nonPage;
	@JSONField(name: "is_data")
	int isData;
	@JSONField(name: "shop_list")
	List<RetailListEntityDataShopList> shopList;
}

class RetailListEntityDataShopList with JsonConvert<RetailListEntityDataShopList> {
	String id;
	@JSONField(name: "shop_sub_id")
	String shopSubId;
	String uid;
	@JSONField(name: "shop_name")
	String shopName;
	@JSONField(name: "delivery_cost")
	int deliveryCost;
	@JSONField(name: "start_delivery_price")
	int startDeliveryPrice;
	@JSONField(name: "service_start_time")
	String serviceStartTime;
	@JSONField(name: "service_end_time")
	String serviceEndTime;
	@JSONField(name: "is_across_day")
	String isAcrossDay;
	@JSONField(name: "delivery_type")
	String deliveryType;
	@JSONField(name: "home_id")
	String homeId;
	String lng;
	String lat;
	@JSONField(name: "month_sales")
	String monthSales;
	@JSONField(name: "service_range")
	String serviceRange;
	@JSONField(name: "goods_number")
	String goodsNumber;
	@JSONField(name: "logo_img")
	String logoImg;
	@JSONField(name: "shop_date")
	String shopDate;
	@JSONField(name: "shop_time")
	String shopTime;
	String distance;
	@JSONField(name: "cart_num")
	int cartNum;
	@JSONField(name: "type")
	String type;
	@JSONField(name: "res_time")
	bool resTime;
	@JSONField(name: "shop_logo")
	String shopLogo;
	@JSONField(name: "is_vip")
	int isVip;
	@JSONField(name: "need_time")
	int needTime;
	@JSONField(name: "has_goods")
	String hasGoods;
	List<RetailListEntityDataShopListActivity> activity;
	@JSONField(name: "goods_list")
	List<RetailListEntityDataShopListGoodsList> goodsList;
}

class RetailListEntityDataShopListActivity with JsonConvert<RetailListEntityDataShopListActivity> {
	String id;
	@JSONField(name: "total_price")
	String totalPrice;
	@JSONField(name: "discount_price")
	String discountPrice;
	String name;
}

class RetailListEntityDataShopListGoodsList with JsonConvert<RetailListEntityDataShopListGoodsList> {
	String id;
	String cid;
	@JSONField(name: "cashier_id")
	String cashierId;
	@JSONField(name: "shop_sub_id")
	String shopSubId;
	@JSONField(name: "goods_name")
	String goodsName;
	@JSONField(name: "goods_code")
	String goodsCode;
	@JSONField(name: "goods_desc")
	String goodsDesc;
	int price;
	@JSONField(name: "vip_price")
	int vipPrice;
	String picture;
	@JSONField(name: "picture_detail")
	String pictureDetail;
	String status;
	@JSONField(name: "discount_rate")
	String discountRate;
	@JSONField(name: "sellout_status")
	String selloutStatus;
	@JSONField(name: "month_sale")
	String monthSale;
	@JSONField(name: "rate_status")
	int rateStatus;
	@JSONField(name: "final_discount")
	String finalDiscount;
	@JSONField(name: "show_discount")
	String showDiscount;
	@JSONField(name: "final_price")
	int finalPrice;
	@JSONField(name: "month_sales")
	String monthSales;
}
