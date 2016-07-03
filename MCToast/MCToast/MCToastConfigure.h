//
//  MCToastConfigure.h
//  MCToast
//
//  Created by 常峻玮 on 16/7/3.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>

//屏幕尺寸
#define MCToastScreenSize [UIScreen mainScreen].bounds.size
//屏幕宽
#define MCToastScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高
#define MCToastScreenHeight [UIScreen mainScreen].bounds.size.height

//RGB颜色
#define MCToastRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//RGBA颜色
#define MCToastRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

//Toast背景颜色
#define MCToastBgColor MCToastRGBA(0, 0, 0, 0.6)

//Toast内间距
#define MCToastPadding UIEdgeInsetsMake(5, 5, 5, 5)

//Toast与屏幕的间距
#define MCToastScreenDistance 15

//Toast的字体大小
#define MCToastTextFont [UIFont systemFontOfSize:14]

//Toast的windowLevel
FOUNDATION_EXTERN CGFloat const toastWindowLevel;
