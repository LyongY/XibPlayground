//
//  ViewController.m
//  XibPlayground
//
//  Created by Raysharp666 on 2021/4/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINib *nib = [UINib nibWithNibName:@"View" bundle:nil];
    NSArray *arr = [nib instantiateWithOwner:nil options:nil];
    UIView *view = arr[0];
    
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:@[
        [view.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:50],
        [view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-50],
        [view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-50],
    ]];

}


@end
