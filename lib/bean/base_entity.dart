import 'package:fluttercmcanyin/generated/json/base/json_convert_content.dart';

class BaseEntity with JsonConvert<BaseEntity> {
	bool result;
	int code;
	String msg;
	String data;
}
