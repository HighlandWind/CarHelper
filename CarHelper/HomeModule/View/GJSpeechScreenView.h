//
//  GJSpeechScreenView.h
//  CarHelper
//
//  Created by Arlenly on 2018/9/23.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseView.h"

@interface GJSpeechScreenView : GJBaseView

@property (nonatomic, copy) void (^blockBack)(void);
+ (GJSpeechScreenView *)installView;

@end
