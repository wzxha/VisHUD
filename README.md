# VisHUD
HUD for iOS 8.

# Show Time
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/vishud_title.gif)
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/vishud_notitle.gif)
![image](https://github.com/Wzxhaha/WZXStorehouse/blob/master/vishud_change.gif)

# API

```objc
@interface VisHUD : UIView 

+ (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)second;

+ (void)show:(NSString *)text userInteraction:(BOOL)userInteractionEnabled;

+ (void)show:(NSString *)text afterDelay:(CGFloat)second;

+ (void)show:(NSString *)text;

+ (void)show;

+ (void)dismiss;

@end
```
