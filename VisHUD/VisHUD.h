//
//  EasyHUD.h
//  Example
//
//  Created by WzxJiang on 16/11/10.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisHUD : UIView 

- (instancetype)initWithView:(UIView *)superView;

- (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second;

- (void)dismiss;
@end



