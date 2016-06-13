//
//  ZHCity.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "ZHCity.h"
#import "ZHDistrict.h"

#pragma mark - ZHDistrict

@interface ZHDistrict (Private)

+ (instancetype)districtWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - ZHCity

@interface ZHCity ()

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *zipCode;
@property (retain, nonatomic) NSArray<ZHDistrict *> *districts;

+ (instancetype)cityWithDictionary:(NSDictionary *)dictionary;

@end

@implementation ZHCity

+ (instancetype)cityWithDictionary:(NSDictionary *)dictionary
{
    ZHCity *city = [[ZHCity alloc] initWithDictionary:dictionary];
    
    return [city autorelease];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *name = dictionary[@"name"];
    NSString *zipCode = dictionary[@"zipcode"];
    NSArray *districtsData = dictionary[@"sub"];
    NSMutableArray<ZHDistrict *> *districts = nil;
    
    if (districtsData.count != 0) {
        districts = [NSMutableArray arrayWithCapacity:0];
        
        for (NSDictionary *dictionary in districtsData) {
            
            ZHDistrict *district = [ZHDistrict districtWithDictionary:dictionary];
            
            [districts addObject:district];
        }
    }
    
    [self setName:name];
    [self setZipCode:zipCode];
    [self setDistricts:districts];
    
    return self;
}

- (void)dealloc
{
    [self setName:nil];
    [self setZipCode:nil];
    [self setDistricts:nil];
    
    [super dealloc];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<ZHCity %p> {\nname: %@", self, self.name];
    
    if (self.zipCode != nil) {
        [description appendFormat:@",\nZIP Code: %@", self.zipCode];
    }
    
    if (self.districts != nil) {
        [description appendFormat:@".\ndistrict: %@", self.districts];
    }
    
    [description appendString:@"\n}"];
    
    return description;
}

@end
