//
//  SecondViewController.m
//  JabberUIDemo
//
//  Created by jinren on 3/26/17.
//  Copyright © 2017 jinren. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segCallAndRecent;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) UIViewController* recentVC;
@property (strong, nonatomic) UIViewController* callVC;
@property (strong, nonatomic) UIViewController* currentVC;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIStoryboard* main = [UIStoryboard storyboardWithName:@"MainVC" bundle:nil];
    self.recentVC = [main instantiateViewControllerWithIdentifier:@"RecentVC"];
    self.callVC = [main instantiateViewControllerWithIdentifier:@"CallVC"];
    self.currentVC = self.callVC;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segVCChanged:(id)sender {
    UISegmentedControl* seg = sender;
    if (seg.selectedSegmentIndex == 1) {
        //Recent
        self.currentVC = self.recentVC;
    } else {
        self.currentVC = self.callVC;
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.currentVC.view.frame = CGRectMake(0, 60, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
}

- (void)setCurrentVC:(UIViewController *)vc
{
    if (_currentVC != nil) {
        [_currentVC willMoveToParentViewController:nil];
        [self addChildViewController:vc];
        [_currentVC.view removeFromSuperview];
        [self.view addSubview:vc.view];
        [_currentVC removeFromParentViewController];
        [vc didMoveToParentViewController:self];
        
    } else {
        [self addChildViewController:vc];
        [self.view addSubview:vc.view];
        [vc didMoveToParentViewController:self];
    }
    _currentVC = vc;
}

@end
