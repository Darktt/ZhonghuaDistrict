//
//  ZHDistrictManager.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "ZHDistrictManager.h"

#pragma mark - ZHState

@interface ZHState (Private)

+ (instancetype)stateWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - ZHCity

@interface ZHCity (Private)

+ (instancetype)cityWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - ZHDistrict

@interface ZHDistrict (Private)

+ (instancetype)districtWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - ZHDistrictManager

@interface ZHDistrictManager ()

@end

@implementation ZHDistrictManager

+ (NSArray<ZHState *> *)chinaStates
{
    NSString *path = [self pathOfPlistName:@"china"];
    NSArray *statesData = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray<ZHState *> *states = [NSMutableArray arrayWithCapacity:0];
    
    for (NSDictionary *dictionary in statesData) {
        ZHState *state = [ZHState stateWithDictionary:dictionary];
        
        [states addObject:state];
    }
    
    return states;
}

+ (NSArray<ZHCity *> *)taiwanCities
{
    NSString *path = [self pathOfPlistName:@"taiwan"];
    NSArray *citiesData = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray<ZHCity *> *cities = [NSMutableArray arrayWithCapacity:0];
    
    for (NSDictionary *dictionary in citiesData) {
        ZHCity *city = [ZHCity cityWithDictionary:dictionary];
        
        [cities addObject:city];
    }
    
    return cities;
}

+ (NSArray<ZHCity *> *)hongKongCities
{
    NSString *path = [self pathOfPlistName:@"hongKong"];
    NSArray *citiesData = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray<ZHCity *> *cities = [NSMutableArray arrayWithCapacity:0];
    
    for (NSDictionary *dictionary in citiesData) {
        ZHCity *city = [ZHCity cityWithDictionary:dictionary];
        
        [cities addObject:city];
    }
    
    return cities;
}

+ (NSArray<ZHDistrict *> *)macauDistricts
{
    NSString *path = [self pathOfPlistName:@"macao"];
    NSArray *districtsData = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray<ZHDistrict *> *districts = [NSMutableArray arrayWithCapacity:0];
    
    for (NSDictionary *dictionary in districtsData) {
        ZHDistrict *district = [ZHDistrict districtWithDictionary:dictionary];
        
        [districts addObject:district];
    }
    
    return districts;
}

+ (NSString *)pathOfPlistName:(NSString *)name
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *bundlePath = [bundle pathForResource:@"Resource" ofType:@"bundle"];
    
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    NSString *path = [resourceBundle pathForResource:name ofType:@"plist"];
    
    return path;
}

@end
