//
//  ViewController.m
//  CATransitionTest
//
//  Created by Алексей Апестин on 27.03.19.
//  Copyright © 2019 Алексей Апестин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *botView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    botView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:botView];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100,330,150,50);
    button.center = self.view.center;
    button.backgroundColor = [UIColor cyanColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = button.frame.size.width / 20;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"Открыть View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openViewAnimation) forControlEvents:UIControlEventTouchUpInside];
    [botView addSubview:button];
}


- (void)openViewAnimation
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    topView.backgroundColor = [UIColor brownColor];
    
    UIButton *buttonTop = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonTop.frame = CGRectMake(100,330,200,100);
    buttonTop.center = self.view.center;
    buttonTop.backgroundColor = [UIColor blackColor];
    buttonTop.layer.masksToBounds = YES;
    buttonTop.layer.cornerRadius = buttonTop.frame.size.width / 20;
    [buttonTop setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [buttonTop setTitle:@"Вернуться обратно" forState:UIControlStateNormal];
    [buttonTop addTarget:self action:@selector(closeViewAnimation) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:buttonTop];
    
    CATransition *animation = [CATransition animation];
    animation.duration = 2.f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromTop;
    [self.view.layer addAnimation:animation forKey:@"animation"];
    
    [self.view addSubview:topView];
}

- (void)closeViewAnimation
{
    CATransition *animation = [CATransition animation];
    animation.duration = 2.f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:animation forKey:@"animation"];

    [self.view.subviews[3] removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
