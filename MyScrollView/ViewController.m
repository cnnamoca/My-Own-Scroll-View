//
//  ViewController.m
//  MyScrollView
//
//  Created by Carlo Namoca on 2017-10-16.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()
@property (strong, nonatomic) MyScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	
    self.scrollView.scrollLimit = CGSizeMake(self.view.frame.size.width + 300, self.view.frame.size.height + 300);
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewPanned:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.view.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
}

-(IBAction)viewPanned:(UIPanGestureRecognizer *)sender
{
    
    CGPoint translationInView = [sender translationInView:self.scrollView];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.scrollView];
    
    
}


@end
