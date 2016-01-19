//
//  SwiftExceptionHandling.h
//  SwiftExceptionHandling
//
//  Created by Wim Haanstra on 19/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//  Based on code found here: http://stackoverflow.com/questions/24710424/catch-an-exception-for-invalid-user-input-in-swift
//

#import <Foundation/Foundation.h>

@interface SwiftExceptionHandling : NSObject

+ (BOOL) performBlock:(void(^)()) block error:(NSError**) error;

@end
