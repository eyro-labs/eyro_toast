//
//  FlutterToastData.h
//  flutter_toast
//
//  Created by Alann Maulana on 05/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterToastData : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSNumber *duration;

-(instancetype) initWithObject:(id)object;

@end

NS_ASSUME_NONNULL_END
