//
//  MaskView.m
//  XibPlayground
//
//  Created by Raysharp666 on 2021/4/14.
//

#import "MaskView.h"
#import "MaskInfo.h"

@implementation MaskView

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    self.backgroundColor = UIColor.clearColor;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = UIColor.clearColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [[UIColor colorWithWhite:0 alpha:0.8] set];
    UIBezierPath *background = [UIBezierPath bezierPathWithRect:rect];
    [background fill];

    UIBezierPath *hollowOut = [UIBezierPath bezierPathWithRect:CGRectZero];
//    [background setUsesEvenOddFillRule:YES];
    
    for (MaskInfo *item in self.subviews) {
        if ([item respondsToSelector:@selector(drawAssociateWithMaskPath:)]) {
            [item drawAssociateWithMaskPath:hollowOut];
        }
    }
}

/**
 {
     kCGBlendModeNormal,
     kCGBlendModeMultiply,
     kCGBlendModeScreen,
     kCGBlendModeOverlay,
     kCGBlendModeDarken,
     kCGBlendModeLighten,
     kCGBlendModeColorDodge,
     kCGBlendModeColorBurn,
     kCGBlendModeSoftLight,
     kCGBlendModeHardLight,
     kCGBlendModeDifference,
     kCGBlendModeExclusion,
     kCGBlendModeHue,
     kCGBlendModeSaturation,
     kCGBlendModeColor,
     kCGBlendModeLuminosity,
     kCGBlendModeClear,
     kCGBlendModeCopy,
     kCGBlendModeSourceIn,
     kCGBlendModeSourceOut,
     kCGBlendModeSourceAtop,
     kCGBlendModeDestinationOver,
     kCGBlendModeDestinationIn,
     kCGBlendModeDestinationOut,
     kCGBlendModeDestinationAtop,
     kCGBlendModeXOR,
     kCGBlendModePlusDarker,
     kCGBlendModePlusLighter
 }
 */
@end
