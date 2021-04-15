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

- (void)drawAssociateWithHollowOutPath:(UIBezierPath *)hollowOutPath {
    
    // 镂空
    {
        CGRect frame = CGRectMake(self.item.frame.origin.x - self.increase / 2,
                                  self.item.frame.origin.y - self.increase / 2,
                                  self.item.frame.size.width + self.increase,
                                  self.item.frame.size.height + self.increase);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:self.cornerRadius];
        [hollowOutPath appendPath:path];
    }
    
    // 线
    {
        CGPoint fromPoint = [self fromePoint];
        CGPoint toPoint = [self toPoint];
        
        [UIColor.redColor set];
        UIBezierPath *line = [UIBezierPath bezierPath];
        line.lineWidth = 1;
        [line moveToPoint:fromPoint];
        [line addLineToPoint:toPoint];
        [line stroke];
    }
}

- (CGPoint)fromePoint {
    CGPoint fromPoint = CGPointZero;
    if (self.fromLocation == MaskInfoLocationTop || self.fromLocation == MaskInfoLocationBottom) {
        // 上下边
        if (self.fromLocation == MaskInfoLocationTop) {
            fromPoint.y = self.item.frame.origin.y - self.increase / 2;
        } else if (self.fromLocation == MaskInfoLocationBottom) {
            fromPoint.y = self.item.frame.origin.y + self.item.frame.size.height + self.increase / 2;
        }
        if (self.fromDirection == MaskInfoDirectionCenter) {
            fromPoint.x = self.item.center.x + self.fromOffset;
        } else if (self.fromDirection == MaskInfoDirectionClockwise) {
            if (self.fromLocation == MaskInfoLocationTop) {
                fromPoint.x = self.item.frame.origin.x + self.fromOffset;
            } else if (self.fromLocation == MaskInfoLocationBottom) {
                fromPoint.x = self.item.frame.origin.x + self.item.frame.size.width - self.fromOffset;
            }
        } else {
            if (self.fromLocation == MaskInfoLocationTop) {
                fromPoint.x = self.item.frame.origin.x + self.item.frame.size.width - self.fromOffset;
            } else if (self.fromLocation == MaskInfoLocationBottom) {
                fromPoint.x = self.item.frame.origin.x + self.fromOffset;
            }
        }
    } else {
        // 左右边
        if (self.fromLocation == MaskInfoLocationRight) {
            fromPoint.x = self.item.frame.origin.x + self.item.frame.size.width + self.increase / 2;
        } else if (self.fromLocation == MaskInfoLocationLeft) {
            fromPoint.x = self.item.frame.origin.x - self.increase / 2;
        }
        if (self.fromDirection == MaskInfoDirectionCenter) {
            fromPoint.y = self.item.center.y + self.fromOffset;
        } else if (self.fromDirection == MaskInfoDirectionClockwise) {
            if (self.fromLocation == MaskInfoLocationRight) {
                fromPoint.y = self.item.frame.origin.y + self.fromOffset;
            } else if (self.fromLocation == MaskInfoLocationLeft) {
                fromPoint.y = self.item.frame.origin.y + self.item.frame.size.height - self.fromOffset;
            }
        } else {
            if (self.fromLocation == MaskInfoLocationRight) {
                fromPoint.y = self.item.frame.origin.y + self.item.frame.size.height - self.fromOffset;
            } else if (self.fromLocation == MaskInfoLocationLeft) {
                fromPoint.y = self.item.frame.origin.y + self.fromOffset;
            }
        }
    }
    return fromPoint;
}

- (CGPoint)toPoint {
    CGPoint toPoint = CGPointZero;
    if (self.toLocation == MaskInfoLocationTop || self.toLocation == MaskInfoLocationBottom) {
        // 上下边
        if (self.toLocation == MaskInfoLocationTop) {
            toPoint.y = self.frame.origin.y;
        } else if (self.toLocation == MaskInfoLocationBottom) {
            toPoint.y = self.frame.origin.y + self.frame.size.height;
        }
        if (self.toDirection == MaskInfoDirectionCenter) {
            toPoint.x = self.center.x + self.toOffset;
        } else if (self.toDirection == MaskInfoDirectionClockwise) {
            if (self.toLocation == MaskInfoLocationTop) {
                toPoint.x = self.frame.origin.x + self.toOffset;
            } else if (self.toLocation == MaskInfoLocationBottom) {
                toPoint.x = self.frame.origin.x + self.frame.size.width - self.toOffset;
            }
        } else {
            if (self.toLocation == MaskInfoLocationTop) {
                toPoint.x = self.frame.origin.x + self.frame.size.width - self.toOffset;
            } else if (self.toLocation == MaskInfoLocationBottom) {
                toPoint.x = self.frame.origin.x + self.toOffset;
            }
        }
    } else {
        // 左右边
        if (self.toLocation == MaskInfoLocationRight) {
            toPoint.x = self.frame.origin.x + self.frame.size.width;
        } else if (self.toLocation == MaskInfoLocationLeft) {
            toPoint.x = self.frame.origin.x;
        }
        if (self.toDirection == MaskInfoDirectionCenter) {
            toPoint.y = self.center.y + self.toOffset;
        } else if (self.toDirection == MaskInfoDirectionClockwise) {
            if (self.toLocation == MaskInfoLocationRight) {
                toPoint.y = self.frame.origin.y + self.toOffset;
            } else if (self.toLocation == MaskInfoLocationLeft) {
                toPoint.y = self.frame.origin.y + self.frame.size.height - self.toOffset;
            }
        } else {
            if (self.toLocation == MaskInfoLocationRight) {
                toPoint.y = self.frame.origin.y + self.frame.size.height - self.toOffset;
            } else if (self.toLocation == MaskInfoLocationLeft) {
                toPoint.y = self.frame.origin.y + self.toOffset;
            }
        }
    }
    return toPoint;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
