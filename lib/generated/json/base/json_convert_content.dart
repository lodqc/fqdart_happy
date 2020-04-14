// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:fluttercmcanyin/bean/user_entity.dart';
import 'package:fluttercmcanyin/generated/json/user_entity_helper.dart';
import 'package:fluttercmcanyin/bean/base_entity.dart';
import 'package:fluttercmcanyin/generated/json/base_entity_helper.dart';
import 'package:fluttercmcanyin/bean/retail_list_entity_entity.dart';
import 'package:fluttercmcanyin/generated/json/retail_list_entity_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case UserEntity:
			return userEntityFromJson(data as UserEntity, json) as T;			case UserData:
			return userDataFromJson(data as UserData, json) as T;			case BaseEntity:
			return baseEntityFromJson(data as BaseEntity, json) as T;			case RetailListEntityEntity:
			return retailListEntityEntityFromJson(data as RetailListEntityEntity, json) as T;			case RetailListEntityData:
			return retailListEntityDataFromJson(data as RetailListEntityData, json) as T;			case RetailListEntityDataShopList:
			return retailListEntityDataShopListFromJson(data as RetailListEntityDataShopList, json) as T;			case RetailListEntityDataShopListActivity:
			return retailListEntityDataShopListActivityFromJson(data as RetailListEntityDataShopListActivity, json) as T;			case RetailListEntityDataShopListGoodsList:
			return retailListEntityDataShopListGoodsListFromJson(data as RetailListEntityDataShopListGoodsList, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case UserEntity:
			return userEntityToJson(data as UserEntity);			case UserData:
			return userDataToJson(data as UserData);			case BaseEntity:
			return baseEntityToJson(data as BaseEntity);			case RetailListEntityEntity:
			return retailListEntityEntityToJson(data as RetailListEntityEntity);			case RetailListEntityData:
			return retailListEntityDataToJson(data as RetailListEntityData);			case RetailListEntityDataShopList:
			return retailListEntityDataShopListToJson(data as RetailListEntityDataShopList);			case RetailListEntityDataShopListActivity:
			return retailListEntityDataShopListActivityToJson(data as RetailListEntityDataShopListActivity);			case RetailListEntityDataShopListGoodsList:
			return retailListEntityDataShopListGoodsListToJson(data as RetailListEntityDataShopListGoodsList);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'UserEntity':
			return UserEntity().fromJson(json);			case 'UserData':
			return UserData().fromJson(json);			case 'BaseEntity':
			return BaseEntity().fromJson(json);			case 'RetailListEntityEntity':
			return RetailListEntityEntity().fromJson(json);			case 'RetailListEntityData':
			return RetailListEntityData().fromJson(json);			case 'RetailListEntityDataShopList':
			return RetailListEntityDataShopList().fromJson(json);			case 'RetailListEntityDataShopListActivity':
			return RetailListEntityDataShopListActivity().fromJson(json);			case 'RetailListEntityDataShopListGoodsList':
			return RetailListEntityDataShopListGoodsList().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'UserEntity':
			return List<UserEntity>();			case 'UserData':
			return List<UserData>();			case 'BaseEntity':
			return List<BaseEntity>();			case 'RetailListEntityEntity':
			return List<RetailListEntityEntity>();			case 'RetailListEntityData':
			return List<RetailListEntityData>();			case 'RetailListEntityDataShopList':
			return List<RetailListEntityDataShopList>();			case 'RetailListEntityDataShopListActivity':
			return List<RetailListEntityDataShopListActivity>();			case 'RetailListEntityDataShopListGoodsList':
			return List<RetailListEntityDataShopListGoodsList>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}