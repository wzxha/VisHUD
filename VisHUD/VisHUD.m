//
//  EasyHUD.m
//  Example
//
//  Created by WzxJiang on 16/11/10.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "VisHUD.h"

@implementation VisHUD {
    VisHUDView * _contentView;
}

static VisHUD * hud = nil;

+ (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second {
    if ([VisHUD shareHUD]->_contentView) {
        [VisHUD dismiss];
    }
    [[VisHUD shareHUD] show:text userInteraction:userInteractionEnabled afterDelay:second];
}

+ (void)show:(NSString *)text afterDelay:(CGFloat)second {
    [self show:text userInteraction:NO afterDelay:second];
}

+ (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled {
    [self show:text userInteraction:userInteractionEnabled afterDelay:0];
}

+ (void)show:(NSString *)text {
    [self show:text userInteraction:NO afterDelay:0];
}

+ (void)show {
    [self show:nil userInteraction:NO afterDelay:0];
}

+ (void)dismiss {
    [[VisHUD shareHUD] dismiss];
}


+ (instancetype)shareHUD {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [VisHUD new];
    });
    return hud;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.frame = [UIScreen mainScreen].bounds;
}

- (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        self.userInteractionEnabled = userInteractionEnabled;
        
        _contentView = [VisHUDView new];
        _contentView.delegate = self;
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];

        SEL selector = NSSelectorFromString(@"show:afterDelay:");
        IMP imp = [_contentView methodForSelector:selector];
        void (*func)(id, SEL, NSString *, CGFloat) = (void *)imp;
        func(_contentView, selector, text, second);
    });
}

- (void)dismiss {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_contentView removeFromSuperview];
        _contentView = nil;
        [self removeFromSuperview];
    });
}

- (void)easyHUDViewDismiss {
    [self dismiss];
}

@end

@implementation VisHUDView {
    UIActivityIndicatorView * _indicatorView;
    UILabel                 * _label;
}

- (void)show:(NSString *)text afterDelay:(CGFloat)second {
    _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:_indicatorView];
    
    [_indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    if (text) {
        _label = [UILabel new];
        _label.font = [UIFont systemFontOfSize:8];
        _label.text = text;
        _label.textColor = [UIColor grayColor];
        [self addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_indicatorView.mas_bottom).offset(3);
        }];
    }
    
    [_indicatorView startAnimating];
    
    if (second > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismiss];
        });
    }
}

- (void)dismiss {
    [self.delegate visHUDDismiss];
}

@end
