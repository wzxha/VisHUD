//
//  UIView+VisHUD.h
//  Example
//
//  Created by WzxJiang on 16/12/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VisHUD)

- (void)vis_show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second;

- (void)vis_show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled;

- (void)vis_show:(NSString *)text afterDelay:(CGFloat)second;

- (void)vis_show:(NSString *)text;

- (void)vis_show;

- (void)vis_dismiss;

@end
