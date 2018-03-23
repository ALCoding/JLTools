//
//  NSMutableDictionary+Extension.m
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"

@implementation NSMutableDictionary (Extension)

- (void)setObjectExtra:(id)anObject forKey:(id <NSCopying>)aKey {
    
    if(anObject && ![anObject isKindOfClass:[NSNull class]] && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
