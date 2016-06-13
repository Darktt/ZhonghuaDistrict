//
//  ZHState.h
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN
@class ZHCity;
@interface ZHState : NSObject

@property (readonly) NSString *name;
@property (readonly, nullable) NSArray<ZHCity *> *cities;

@end
NS_ASSUME_NONNULL_END