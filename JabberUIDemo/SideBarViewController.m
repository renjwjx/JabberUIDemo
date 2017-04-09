//
//  SideBarViewController.m
//  JabberUIDemo
//
//  Created by jinren on 4/9/17.
//  Copyright © 2017 jinren. All rights reserved.
//

#import "SideBarViewController.h"
#import "MainViewController.h"

@interface SideBarViewController ()

@end

@implementation SideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)hideSidebar:(id)sender {
    MainViewController *rootViewController = (MainViewController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController toggleSideBar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
