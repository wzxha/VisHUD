//
//  UIView+VisHUD.m
//  Example
//
//  Created by WzxJiang on 16/12/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "UIView+VisHUD.h"
#import "VisHUD.h"

@implementation UIView (VisHUD)

- (void)vis_show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second {
    [[self vis_hud] show:text userInteraction:userInteractionEnabled afterDelay:second];
}

- (void)vis_show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled {
    [[self vis_hud] show:text userInteraction:userInteractionEnabled afterDelay:0];
}

- (void)vis_show:(NSString *)text afterDelay:(CGFloat)second {
    [[self vis_hud] show:text userInteraction:NO afterDelay:second];
}

- (void)vis_show:(NSString *)text {
    [[self vis_hud] show:text userInteraction:NO afterDelay:0];
}

- (void)vis_show {
    [[self vis_hud] show:nil userInteraction:NO afterDelay:0];
}

- (void)vis_dismiss {
    for (UIView * subview in self.subviews) {
        if ([subview isKindOfClass: [VisHUD class]]) {
            [((VisHUD *)subview) dismiss];
        }
    }
}

- (VisHUD *)vis_hud {
    VisHUD * hud = nil;
    for (UIView * subview in self.subviews) {
        if ([subview isKindOfClass: [VisHUD class]]) {
            hud = (VisHUD *)subview;
            break;
        }
    }
    
    if (!hud) {
        hud = [[VisHUD alloc] initWithView:self];
    }
    
    return hud;
}

@end

