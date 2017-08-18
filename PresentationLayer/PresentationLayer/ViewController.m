//
//  ViewController.m
//  PresentationLayer
//
//  Created by fns on 2017/8/18.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    //    CATransition *transition = [CATransition animation];
    //    transition.type = kCATransitionPush;
    //    transition.subtype = kCATransitionFromRight;
    //    self.colorLayer.actions = @{@"backgroundColor": transition};
    //
    //    [self.view bringSubviewToFront:self.changeColor];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
