//
// Copyright (c) 2019, the Eyro Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EyroToastData : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSNumber *duration;

-(instancetype) initWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
