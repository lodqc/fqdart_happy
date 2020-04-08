import 'package:fluttercmcanyin/generated/json/base/json_convert_content.dart';
import 'package:fluttercmcanyin/generated/json/base/json_filed.dart';

class UserEntity with JsonConvert<UserEntity> {
	bool result;
	int code;
	String msg;
	UserData data;
}

class UserData with JsonConvert<UserData> {
	String token;
	@JSONField(name: "nick_name")
	String nickName;
	@JSONField(name: "account_num")
	String accountNum;
	String mobile;
	@JSONField(name: "avatar_url")
	String avatarUrl;
	@override
	bool operator ==(Object other) =>
			identical(this, other) ||
					other is UserData &&
							runtimeType == other.runtimeType &&
							token == other.token &&
							nickName == other.nickName &&
							accountNum == other.accountNum &&
							mobile == other.mobile &&
							avatarUrl == other.avatarUrl;

	@override
	int get hashCode =>
			token.hashCode ^
			nickName.hashCode ^
			accountNum.hashCode ^
			mobile.hashCode ^
			avatarUrl.hashCode;
}
