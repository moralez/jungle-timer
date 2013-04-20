//
//  JungleTimerCell.h
//  jungle-timer
//
//  Created by Johnny Moralez on 4/20/13.
//  Copyright (c) 2013 Bathroom Gaming. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JungleTimerButton.h"

@interface JungleTimerCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet JungleTimerButton *button;
@property (nonatomic, strong) IBOutlet NSString *countDownText;

@end
