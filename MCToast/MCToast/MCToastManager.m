//
//  MCToastManager.m
//  MCToast
//
//  Created by 常峻玮 on 16/7/3.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCToastManager.h"
#import "MCToast.h"

@interface MCToastManager ()

@property(nonatomic,strong)UIWindow *window;

@property(nonatomic,strong)NSMutableArray *toastArray;
@property(nonatomic,assign)NSInteger maxToastCount;

@end

@implementation MCToastManager

#pragma mark - Public
+(void)showText:(NSString *)text{
    MCToastTextView *lToastView=[MCToastTextView toastTextViewWith:text];
    [MCToastManager showToastView:lToastView];
}

+(void)showToastView:(MCToastComponentView *)toastView{
    [[MCToastManager manager]addToastView:toastView];
}

#pragma mark - Private
+(MCToastManager *)manager{
    static MCToastManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[MCToastManager alloc]init];
    });
    return manager;
}

#pragma mark - Init
-(instancetype)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Setter And Getter
-(UIWindow *)window{
    if (_window) {
        return _window;
    }
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.userInteractionEnabled=NO;
    _window.windowLevel=toastWindowLevel;
    [_window makeKeyAndVisible];
    return _window;
}

-(NSMutableArray *)toastArray{
    if (_toastArray) {
        return _toastArray;
    }
    _toastArray=[NSMutableArray array];
    return _toastArray;
}
-(NSInteger)maxToastCount{
    if (_maxToastCount) {
        return _maxToastCount;
    }
    _maxToastCount=3;
    return _maxToastCount;
}
#pragma mark -
-(void)addToastView:(MCToastComponentView *)toastView{
    [toastView prepare];
    toastView.center=CGPointMake(self.window.bounds.size.width/2, self.window.bounds.size.height-toastView.bounds.size.height/2);
    [self.toastArray addObject:toastView];
    [self.window addSubview:toastView];
    
    __weak typeof(toastView) weakToastView=toastView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeToastView:weakToastView];
    });
}
-(void)removeToastView:(MCToastComponentView *)toastView{
    if (![self.toastArray containsObject:toastView]) {
        return;
    }
    [self.toastArray removeObject:toastView];
    [UIView animateWithDuration:0.5 animations:^{
        toastView.alpha=0.0;
    } completion:^(BOOL finished) {
        [toastView removeFromSuperview];
    }];
}
@end
