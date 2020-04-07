import 'package:fluttercmcanyin/bean/base_entity.dart';

baseEntityFromJson(BaseEntity data, Map<String, dynamic> json) {
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
		data.data = json['data']?.toString();
	}
	return data;
}

Map<String, dynamic> baseEntityToJson(BaseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['result'] = entity.result;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data;
	return data;
}