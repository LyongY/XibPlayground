//
//  MaskInfo.h
//  XibPlayground
//
//  Created by Raysharp666 on 2021/4/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MaskInfoLocation) {
    MaskInfoLocationTop,
    MaskInfoLocationLeft,
    MaskInfoLocationBottom,
    MaskInfoLocationRight,
};

typedef NS_ENUM(NSUInteger, MaskInfoDirection) {
    MaskInfoDirectionCenter,
    MaskInfoDirectionClockwise,
    MaskInfoDirectionCounterclockwise,
};

IB_DESIGNABLE
@interface MaskInfo : UILabel

@property (nonatomic, weak) IBOutlet UIView *item;

#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSInteger fromLocation;
@property (nonatomic, assign) IBInspectable NSInteger fromDirection;
#else
@property (nonatomic, assign) MaskInfoLocation fromLocation;
@property (nonatomic, assign) MaskInfoDirection fromDirection;
#endif
@property (nonatomic, assign) IBInspectable CGFloat fromOffset;


#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSInteger toLocation;
@property (nonatomic, assign) IBInspectable NSInteger toDirection;
#else
@property (nonatomic, assign) MaskInfoLocation toLocation;
@property (nonatomic, assign) MaskInfoDirection toDirection;
#endif
@property (nonatomic, assign) IBInspectable CGFloat toOffset;

/// 镂空四周增加量
@property (nonatomic, assign) IBInspectable CGFloat increase;
/// 镂空圆角
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;


- (void)drawAssociateWithHollowOutPath:(UIBezierPath *)hollowOutPath;
@end

NS_ASSUME_NONNULL_END
