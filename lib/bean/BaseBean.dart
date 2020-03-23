class BaseBean {
  bool result;
  int code;
  String msg;
  String data;

  BaseBean({this.result, this.code, this.msg, this.data});

  BaseBean.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
