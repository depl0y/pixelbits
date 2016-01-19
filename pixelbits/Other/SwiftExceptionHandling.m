//
//  SwiftExceptionHandling.m
//  SwiftExceptionHandling
//
//  Created by Wim Haanstra on 19/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

#import "SwiftExceptionHandling.h"

@implementation SwiftExceptionHandling

+ (BOOL) performBlock:(void(^)()) block error:(NSError**) error {

	@try {
		if (block) {
			block();
		}
	}
	@catch (NSException* exception) {
		if (error) {
			*error = [NSError errorWithDomain:@"com.sortedbits" code:42 userInfo:@{NSLocalizedDescriptionKey: exception.name}];
		}
		return NO;
	}
	return YES;
}

@end
