//
//  CustomImageAlertView.m
//  XBProject
//
//  Created by ljkj on 16/8/29.
//  Copyright © 2016年 trustway_mac. All rights reserved.
//

#import "CustomImageAlertView.h"
#import "UIView+Extension.h"

#define  KScreenW             [[UIScreen mainScreen] bounds].size.width
#define  KScreenH             [[UIScreen mainScreen] bounds].size.height
#define  KScreenX             [[UIScreen mainScreen] bounds].size.width/375

@interface CustomImageAlertView ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong)UIView *containView;

@end

@implementation CustomImageAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
      
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [self dismiss];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if (self.isOpenUserInterFace == NO)
    {
        if ([touch.view isMemberOfClass:[self.containView class]])
        {
            return NO;
            
        }else
        {
            if ([touch.view isKindOfClass:[UITextView class]])
            {
                return NO;
            }
            return YES;
        }
 
    }else
    {
        return NO;
    }
}


- (void)showImageView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    self.frame = window.bounds;
    
    self.containView.centerX = KScreenW/2;
    self.containView.centerY = KScreenH/2;
    
}



- (UIView *)containView
{
    if (!_containView)
    {
        UIView *bgView = [[UIView alloc]init];
        bgView.userInteractionEnabled = YES;
        bgView.layer.cornerRadius = 5*KScreenX;
        bgView.layer.masksToBounds = YES;
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        self.containView = bgView;
    }
    return _containView;
}

- (void)setViewController:(UIViewController *)viewController
{
    _viewController = viewController;
    self.contentView = _viewController.view;


}

- (void)setContentView:(UIView *)contentView
{
    _contentView = contentView;
    _contentView.x = _contentView.y = 0;
    self.containView.width = CGRectGetWidth(self.contentView.frame);
    self.containView.height = CGRectGetHeight(self.contentView.frame);
    [self.containView addSubview:contentView];
    
}


- (void)dismiss
{
    [self removeFromSuperview];
}


@end
