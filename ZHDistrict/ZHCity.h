//
//  ZHCity.h
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN
@class ZHDistrict;
@interface ZHCity : NSObject

@property (readonly) NSString *name;
@property (readonly, nullable) NSString *zipCode;
@property (readonly, nullable) NSArray<ZHDistrict *> *districts;

@end
NS_ASSUME_NONNULL_END