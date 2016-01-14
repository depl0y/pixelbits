//
//  TryCatch.m
//  pixelbits
//
//  Created by Wim Haanstra on 14/01/16.
//  Copyright © 2016 Wim Haanstra. All rights reserved.
//

#import "TryCatch.h"

@implementation TryCatch

+ (BOOL)tryBlock:(void(^)())tryBlock
		   error:(NSError **)error
{
	@try {
		tryBlock ? tryBlock() : nil;
	}
	@catch (NSException *exception) {
		if (error) {
			*error = [NSError errorWithDomain:@"com.something"
										 code:42
									 userInfo:@{NSLocalizedDescriptionKey: exception.name}];
		}
		return NO;
	}
	return YES;
}

@end
