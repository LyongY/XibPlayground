//
//  MaskInfo.m
//  XibPlayground
//
//  Created by Raysharp666 on 2021/4/14.
//

#import "MaskInfo.h"

@implementation MaskInfo

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)awakeFromNib {
    [self setup];
    [super awakeFromNib];
}

- (void)setup {
    self.textColor = UIColor.whiteColor;
}

- (void)drawAssociateWithMaskPath:(UIBezierPath *)maskPath {
    
    // 镂空
    {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.item.frame cornerRadius:6];
        [maskPath appendPath:path];
        [maskPath fillWithBlendMode:kCGBlendModeClear alpha:1];
    }
    
    // 线
    [UIColor.redColor set];
    UIBezierPath *line = [UIBezierPath bezierPath];
    line.lineWidth = 1;
    [line moveToPoint:self.item.center];
    [line addLineToPoint:self.center];
    [line stroke];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
