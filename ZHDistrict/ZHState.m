//
//  ZHState.m
//  ZhonghuaDistrict
//
//  Created by Darktt on 2016/6/8.
//  Copyright © 2016年 Darktt. All rights reserved.
//

#import "ZHState.h"
#import "ZHCity.h"

#pragma mark - ZHCity

@interface ZHCity (Private)

+ (instancetype)cityWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - ZHState

@interface ZHState ()

@property (copy, nonatomic) NSString *name;
@property (retain, nonatomic) NSArray<ZHCity *> *cities;

+ (instancetype)stateWithDictionary:(NSDictionary *)dictionary;

@end

@implementation ZHState

+ (instancetype)stateWithDictionary:(NSDictionary *)dictionary
{
    ZHState *state = [[ZHState alloc] initWithDictionary:dictionary];
    
    return [state autorelease];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *name = dictionary[@"name"];
    NSArray *citiesData = dictionary[@"sub"];
    NSMutableArray<ZHCity *> *cities = nil;
    
    if (citiesData.count != 0) {
        cities = [NSMutableArray arrayWithCapacity:0];
        
        for (NSDictionary *dictionary in citiesData) {
            ZHCity *city = [ZHCity cityWithDictionary:dictionary];
            
            [cities addObject:city];
        }
    }
    
    [self setName:name];
    [self setCities:cities];
    
    return self;
}

- (void)dealloc
{
    [self setName:nil];
    [self setCities:nil];
    
    [super dealloc];
}

- (NSString *)description
{
    NSString *description = [NSString stringWithFormat:@"<ZHState %p> {\nname = %@,\ncities = %@\n}", self, self.name, self.cities];
    
    return description;
}

@end
