//
//  AppPreferences.h
//  jungle-timer
//
//  Created by Johnny Moralez on 4/15/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShowMinutesAndSeconds @"showMinutesAndSeconds"
#define kVibrate               @"vibrate"

@interface AppPreferences : NSObject

+ (BOOL)showMinutesAndSeconds;
+ (BOOL)shouldVibrate;

+ (void)setShowMinutesAndSeconds:(BOOL)show;
+ (void)setVibrate:(BOOL)vibrate;

@end
