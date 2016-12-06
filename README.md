# VisHUD
HUD for iOS 8.

# Show Time
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/vishud_title.gif)
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/vishud_notitle.gif)
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/vishud_change.gif)

# API

```objc
@interface UIView (VisHUD)

- (void)vis_show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second;

- (void)vis_show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled;

- (void)vis_show:(NSString *)text afterDelay:(CGFloat)second;

- (void)vis_show:(NSString *)text;

- (void)vis_show;

- (void)vis_dismiss;
@end
```
