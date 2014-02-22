//
//  TRVSQueryStringSerializer.m
//  TRVSQueryStringSerializer
//
//  Created by Travis Jeffery on 2/21/14.
//
//

#import "TRVSQueryStringSerializer.h"

@implementation TRVSQueryStringSerializer

+ (NSString *)queryStringUsingDictionary:(NSDictionary *)dictionary {
    return [[self queryStringComponentsUsingDictionary:dictionary] componentsJoinedByString:@"&"];
}

#pragma mark - Private

+ (NSArray *)queryStringComponentsUsingDictionary:(NSDictionary *)dictionary {
    NSMutableArray *pairs = [[NSMutableArray alloc] initWithCapacity:dictionary.count];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, id value, BOOL *stop) {
        if ([value isKindOfClass:NSArray.class]) {
            [value enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [self addQueryStringComponentUsingKey:key value:obj toPairs:pairs];
            }];
        } else {
            [self addQueryStringComponentUsingKey:key value:value toPairs:pairs];
        }
    }];

    return pairs;
}

+ (void)addQueryStringComponentUsingKey:(NSString *)key value:(NSString *)value toPairs:(NSMutableArray *)components {
    [components addObject:[NSString stringWithFormat:@"%@=%@", [self escapeString:key], [self escapeString:value]]];
}

+ (NSString *)escapeString:(NSString *)string {
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)string, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8));
}

@end
