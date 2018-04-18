//
//  CustomImageAlertView.h
//  XBProject
//
//  Created by ljkj on 16/8/29.
//  Copyright © 2016年 trustway_mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageAlertView : UIView

@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UIViewController *viewController;
@property (nonatomic,assign)BOOL isOpenUserInterFace;
- (void)showImageView;

@end
