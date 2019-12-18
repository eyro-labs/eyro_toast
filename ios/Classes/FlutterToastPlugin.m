#import "FlutterToastPlugin.h"
#import "FlutterToastData.h"
#import <Toast/Toast.h>

@implementation FlutterToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_toast"
            binaryMessenger:[registrar messenger]];
  FlutterToastPlugin* instance = [[FlutterToastPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"showToast" isEqualToString:call.method]) {
      FlutterToastData *data = [[FlutterToastData alloc] initWithObject:call.arguments];
      if (data) {
          id<UIApplicationDelegate> appDelegate = [[UIApplication sharedApplication] delegate];
          UIView *rootView = appDelegate.window.rootViewController.view;
          if (!rootView) {
              rootView = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
          }
          
          [rootView makeToast:data.text duration:data.duration.doubleValue position:CSToastPositionBottom];
          result(@YES);
          return;
      }
      result(@NO);
      return;
  }

  result(FlutterMethodNotImplemented);
}

@end
