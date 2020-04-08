import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttercmcanyin/common/UserRepository.dart';
import 'package:fluttercmcanyin/generated/json/base/json_convert_content.dart';
import 'package:fluttercmcanyin/http/API.dart';
import 'package:simple_rc4/simple_rc4.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = new HttpUtil();
    return instance;
  }

  /*
   * config it and create
   */
  HttpUtil() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = new BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: API.BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      sendTimeout: 5000,
//      //Http请求头.
//      headers: {
//        //do something
//        "version": "1.0.0"
//      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      contentType: Headers.jsonContentType,
      //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.plain,
    );

    dio = new Dio(options);
    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      options.queryParameters.addAll({
        "voice": "false",
        "app_plat": "android",
        "mobile_model": "android9",
        "version": "1.2.2",
        "token": UserRepository.getInstance().user?.token??""
      });

      options.data = jsonEncode(options.queryParameters);
      print("dio--queryParameters--=${jsonEncode(options.queryParameters)}");
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      // Do something with response error
      return e; //continue
    }));
//    Https证书校验
//    String PEM="XXXXX"; // certificate content
//    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
//      client.badCertificateCallback=(X509Certificate cert, String host, int port){
//        if(cert.pem==PEM){ // Verify the certificate
//          return true;
//        }
//        return false;
//      };
//    };

//    对于自签名的证书，我们也可以将其添加到本地证书信任链中，这样证书验证时就会自动通过，而不会再走到badCertificateCallback回调中
//    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
//      SecurityContext sc = new SecurityContext();
//      //file is the path of certificate
//      sc.setTrustedCertificates(file);
//      HttpClient httpClient = new HttpClient(context: sc);
//      return httpClient;
//    };
  }

  /*
   * get请求
   */
  get(path, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(path,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');

//      response.data; 响应体
//      response.headers; 响应头
//      response.request; 请求体
//      response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * post请求
   */
  Future<T> post<T>(path, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(path,
          queryParameters: data, options: options, cancelToken: cancelToken);
      //解密参数
//      var decodeString = RC4("2*s&3Hd#kd90").decodeString(response.data, true);
      print("dio--decodeString--=${response.data}");
      var baseBean = JsonConvert.fromJsonAsT<T>(json.decode(response.data));

      return baseBean;
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return null;
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}
