//
//  GJHomeSpeechButton.h
//  CarHelper
//
//  Created by Arlenly on 2018/9/23.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GJHomeSpeechButton : UIButton

@property (nonatomic, copy) void (^speechClickBlock)(void);
+ (GJHomeSpeechButton *)install;

@end
