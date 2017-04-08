//
//  AppDelegate.h
//  JabberUIDemo
//
//  Created by jinren on 3/26/17.
//  Copyright © 2017 jinren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet MainViewController* mainVC;

- (void)jabberLogin;

@end

