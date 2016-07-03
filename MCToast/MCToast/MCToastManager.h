//
//  MCToastManager.h
//  MCToast
//
//  Created by 常峻玮 on 16/7/3.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCToastComponentView;
@interface MCToastManager : NSObject

+(void)showText:(NSString *)text;

+(void)showToastView:(MCToastComponentView *)toastView;

@end
