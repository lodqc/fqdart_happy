import 'package:fluttercmcanyin/bean/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = json['result'];
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new UserData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['result'] = entity.result;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

userDataFromJson(UserData data, Map<String, dynamic> json) {
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['nick_name'] != null) {
		data.nickName = json['nick_name']?.toString();
	}
	if (json['account_num'] != null) {
		data.accountNum = json['account_num']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['avatar_url'] != null) {
		data.avatarUrl = json['avatar_url']?.toString();
	}
	return data;
}

Map<String, dynamic> userDataToJson(UserData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['token'] = entity.token;
	data['nick_name'] = entity.nickName;
	data['account_num'] = entity.accountNum;
	data['mobile'] = entity.mobile;
	data['avatar_url'] = entity.avatarUrl;
	return data;
}