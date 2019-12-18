//
// Copyright (c) 2019, the Eyro Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
//

#import "EyroToastPlugin.h"
#import "EyroToastData.h"
#import <Toast/Toast.h>

@implementation EyroToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"eyro_toast"
            binaryMessenger:[registrar messenger]];
  EyroToastPlugin* instance = [[EyroToastPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"showToast" isEqualToString:call.method]) {
      EyroToastData *data = [[EyroToastData alloc] initWithObject:call.arguments];
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
