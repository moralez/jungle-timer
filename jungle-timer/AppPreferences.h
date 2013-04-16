//
//  AppPreferences.h
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShowMinutesAndSeconds @"showMinutesAndSeconds"

@interface AppPreferences : NSObject

+ (BOOL)showMinutesAndSeconds;
+ (void)setShowMinutesAndSeconds:(BOOL)show;

@end
