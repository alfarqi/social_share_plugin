import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

typedef Future<dynamic> OnCancelHandler();
typedef Future<dynamic> OnErrorHandler(String error);
typedef Future<dynamic> OnSuccessHandler(String postId);

class SocialSharePlugin {
  static const MethodChannel _channel =
      const MethodChannel('social_share_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> shareToFeedInstagram({
    String type = 'image/*',
    @required String path,
    OnSuccessHandler onSuccess,
    OnCancelHandler onCancel,
  }) async {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "onSuccess":
          
          
          print('mehrbanni cum on u and i will do what u need');
          return onSuccess(call.arguments);
        case "onCancel":
          return onCancel();
        default:
          throw UnsupportedError("Unknown method called");
      }
    });
    return _channel.invokeMethod('shareToFeedInstagram', <String, dynamic>{
      'type': type,
      'path': path,
    });
  }

  static Future<void> shareToFeedFacebook({
    String caption,
    @required String path,
    OnSuccessHandler onSuccess,
    OnCancelHandler onCancel,
    OnErrorHandler onError,
  }) async {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "onSuccess":
          return onSuccess(call.arguments);
        case "onCancel":
          return onCancel();
        case "onError":
          return onError(call.arguments);
        default:
          throw UnsupportedError("Unknown method called");
      }
    });
    return _channel.invokeMethod('shareToFeedFacebook', <String, dynamic>{
      'caption': caption,
      'path': path,
    });
  }

  static Future<dynamic> shareToFeedFacebookLink({
    String quote,
    @required String url,
    OnSuccessHandler onSuccess,
    OnCancelHandler onCancel,
    OnErrorHandler onError,
  }) async {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "onSuccess":
          return onSuccess(call.arguments);
        case "onCancel":
          return onCancel();
        case "onError":
          return onError(call.arguments);
        default:
          throw UnsupportedError("Unknown method called");
      }
    });
    return _channel.invokeMethod('shareToFeedFacebookLink', <String, dynamic>{
      'quote': quote,
      'url': url,
    });
  }
  
  
  static Future<void> shareToWhatsapp(String type, String path) async {
    // _channel.setMethodCallHandler((call) {
    //   switch (call.method) {
    //     case "onSuccess":
    //       return onSuccess(call.arguments);
    //     case "onCancel":
    //       return onCancel();
    //     case "onError":
    //       return onError(call.arguments);
    //     default:
    //       throw UnsupportedError("Unknown method called");
    //   }
    // });
    return _channel.invokeMethod('shareToWhatsapp', <String, dynamic>{
      'type': type,
      'path': path,
    });
  }

  static Future<void> shareTextToFeedInstagram(String txtMsg) async {
    return _channel.invokeMethod('shareTextToFeedInstagram', <String, dynamic>{
      'textMsg': txtMsg,
    });
  }


  static Future<void> shareTextToWhatsapp(String txtMsg) async {
    return _channel.invokeMethod('shareTextToWhatsapp', <String, dynamic>{
      'textMsg': txtMsg,
    });
  }


}
