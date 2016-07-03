//
//  MCToastTextView.m
//  MCToast
//
//  Created by 常峻玮 on 16/7/3.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCToastTextView.h"
#import "MCToast.h"

@interface MCToastTextView()
@property(nonatomic,strong)UILabel *textLabel;
@end

@implementation MCToastTextView

+(MCToastTextView *)toastTextViewWith:(NSString *)text{
    MCToastTextView *lToastView=[[MCToastTextView alloc]init];
    lToastView.textLabel.text=text;
    return lToastView;
}
#pragma mark - Init
-(instancetype)init{
    self=[super init];
    if (self) {
        [self configure];
    }
    return self;
}
-(void)configure{
    self.backgroundColor=MCToastBgColor;
    self.layer.cornerRadius=5;
    self.textLabel=[[UILabel alloc]init];
    self.textLabel.numberOfLines=0;
    self.textLabel.font=MCToastTextFont;
    self.textLabel.textColor=[UIColor whiteColor];
    self.textLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.textLabel];
}
#pragma mark - Setter And Getter


#pragma mark - Override
-(void)prepare{
    [super prepare];
    CGSize maxLabelSize=CGSizeMake(MCToastScreenWidth-2*MCToastScreenDistance-MCToastPadding.left-MCToastPadding.right, MCToastScreenHeight-2*MCToastScreenDistance-MCToastPadding.top-MCToastPadding.bottom);
    CGRect labelRect=[self.textLabel.text boundingRectWithSize:maxLabelSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.textLabel.font} context:nil];
    labelRect.origin.x=MCToastPadding.left;
    labelRect.origin.y=MCToastPadding.top;
    CGRect viewRect=CGRectMake(0, 0, labelRect.size.width+MCToastPadding.left+MCToastPadding.right, labelRect.size.height+MCToastPadding.top+MCToastPadding.bottom);
    self.frame=viewRect;
    self.textLabel.frame=labelRect;
}
@end
