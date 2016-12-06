//
//  EasyHUD.m
//  Example
//
//  Created by WzxJiang on 16/11/10.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "VisHUD.h"

@interface VisHUDView : UIView

- (void)show:(NSString *)text;

@end

@implementation VisHUDView {
    UIActivityIndicatorView * _indicatorView;
    UILabel                 * _label;
    BOOL                      _dismissed;
}

- (instancetype)init {
    if (self = [super init]) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)show:(NSString *)text {
    _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_indicatorView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_indicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_indicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    if (text) {
        _label = [UILabel new];
        _label.font = [UIFont systemFontOfSize:8];
        _label.text = text;
        _label.textColor = [UIColor grayColor];
        _label.numberOfLines = 0;
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_label];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_indicatorView attribute:NSLayoutAttributeBottom multiplier:1 constant:3]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    }
    
    [_indicatorView startAnimating];
}

@end

//------------------------------------------------------------------------------------------

@implementation VisHUD {
    VisHUDView * _contentView;
    __weak UIView * _superView;
}

- (instancetype)initWithView:(UIView *)superView {
    if (self = [super init]) {
        _superView = superView;
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_superView addSubview: self];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        
        self.userInteractionEnabled = userInteractionEnabled;
        
        _contentView = [VisHUDView new];
        [self addSubview:_contentView];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0]];

        [_contentView show:text];
        
        if (second > 0) {
            [self performSelector:@selector(dismiss) withObject:nil afterDelay:second];
        }
    });
}

- (void)dismiss {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeFromSuperview];        
    });
}

@end
