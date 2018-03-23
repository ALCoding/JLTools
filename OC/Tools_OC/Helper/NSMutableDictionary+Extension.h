//
//  NSMutableDictionary+Extension.h
//  Tools_OC
//
//  Created by Jalen.He on 2017/6/20.
//  Copyright © 2017年 Jalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Extension)

- (void)setObjectExtra:(id)anObject forKey:(id <NSCopying>)aKey;

@end
