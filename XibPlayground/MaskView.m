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
    for (MaskInfo *item in self.subviews) {
        if ([item respondsToSelector:@selector(drawAssociateWithHollowOutPath:)]) {
            [item drawAssociateWithHollowOutPath:hollowOut];
        }
    }
    [hollowOut fillWithBlendMode:kCGBlendModeClear alpha:1];
    
    [UIColor.whiteColor set];
    hollowOut.lineWidth = 2;
    [hollowOut stroke];
}

@end
