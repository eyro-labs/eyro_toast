//
// Copyright (c) 2019, the Eyro Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
//

#import "EyroToastData.h"

@implementation EyroToastData

-(instancetype) initWithObject:(id)object {
    if (self = [super init]) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = object;
            _text = dict[@"text"];
            NSNumber *length = dict[@"duration"];
            if (length.intValue == 0) {
                _duration = [NSNumber numberWithDouble:2.0];
            } else if (length.intValue == 1) {
                _duration = [NSNumber numberWithDouble:3.5];
            } else {
                _duration = length;
            }
            
        }
    }
    
    return self;
}

@end
