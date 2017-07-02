#import "UIButton+ShowHideImageView.h"
#import <objc/runtime.h>

@implementation UIButton (ShowHideImageView)

- (void)shiv_showImageView {
    UIImage* image = objc_getAssociatedObject(self, (__bridge const void *)(@(self.state)));
    if (image && [self imageForState:self.state] == nil) {
        [self setImage:image forState:self.state];
    }
}

- (void)shiv_hideImageView {
    UIImage* image = [self imageForState:self.state];
    [self setImage:nil forState:self.state];
    
    objc_setAssociatedObject(self, (__bridge const void *)(@(self.state)), image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
