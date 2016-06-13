//
//  ZHDistrictManager.h
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

@import Foundation;

#import "ZHState.h"
#import "ZHCity.h"
#import "ZHDistrict.h"

NS_ASSUME_NONNULL_BEGIN
@interface ZHDistrictManager : NSObject

+ (NSArray<ZHState *> *)chinaStates;
+ (NSArray<ZHCity *> *)taiwanCities;
+ (NSArray<ZHCity *> *)hongKongCities;
+ (NSArray<ZHDistrict *> *)macauDistricts;

@end
NS_ASSUME_NONNULL_END