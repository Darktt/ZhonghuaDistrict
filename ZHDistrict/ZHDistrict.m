//
//  ZHDistrict.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "ZHDistrict.h"

@interface ZHDistrict ()

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *zipCode;

+ (instancetype)districtWithDictionary:(NSDictionary *)dictionary;

@end

@implementation ZHDistrict

+ (instancetype)districtWithDictionary:(NSDictionary *)dictionary
{
    ZHDistrict *district = [[ZHDistrict alloc] initWithDictionary:dictionary];
    
    return district;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *name = dictionary[@"name"];
    NSString *zipCode = dictionary[@"zipcode"];
    
    [self setName:name];
    [self setZipCode:zipCode];
    
    return self;
}

- (void)dealloc
{
    [self setName:nil];
    [self setZipCode:nil];
    
    [super dealloc];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<ZHCity %p> {\nname: %@", self, self.name];
    
    if (self.zipCode != nil) {
        [description appendFormat:@",\nZIP Code: %@", self.zipCode];
    }
    
    [description appendString:@"\n}"];
    
    return description;
}

@end
