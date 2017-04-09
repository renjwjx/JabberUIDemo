//
//  FirstViewController.m
//  JabberUIDemo
//
//  Created by jinren on 3/26/17.
//  Copyright © 2017 jinren. All rights reserved.
//

#import "FirstViewController.h"
#import "AddContactViewController.h"
#import "AddFavoViewController.h"
#import "MainViewController.h"


@interface FirstViewController ()

@property (nonatomic, weak) IBOutlet UIView* contactContainer;
@property (nonatomic, weak) IBOutlet UIView* favoriteContainer;
//must use strong, avoid to release by system after set to nil
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addBarButton;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleContactAndFavorite:(UISegmentedControl*)sender
{
    if (sender.selectedSegmentIndex == 1) {
        self.contactContainer.hidden = YES;
        self.favoriteContainer.hidden = NO;
        self.navigationItem.rightBarButtonItem = nil;
    } else {
        self.contactContainer.hidden = NO;
        self.favoriteContainer.hidden = YES;
        self.navigationItem.rightBarButtonItem = self.addBarButton;
    }
}

- (IBAction)addButton:(id)sender
{

    UIAlertController* alertAdd = [UIAlertController alertControllerWithTitle:@"Add Contact title" message:@"Add Contact message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* actionAddContact = [UIAlertAction actionWithTitle:@"Add Contact Show VC" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Add contact Show VC");
        [self openAddContactVC];
    }];
    
    UIAlertAction* actionAddFavor = [UIAlertAction actionWithTitle:@"Add Favorites Show Modally" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Add Favorites Show Modally");
        [self openAddFavoriteVC];
    }];

    UIAlertAction* actionCreateGroup = [UIAlertAction actionWithTitle:@"Create Group Action" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Create Group action");
    }];

    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel");
    }];

    [alertAdd addAction:actionAddContact];
    [alertAdd addAction:actionAddFavor];
    if (self.favoriteContainer.isHidden) {
        [alertAdd addAction:actionCreateGroup];
    }
    [alertAdd addAction:actionCancel];

    [self presentViewController:alertAdd animated:YES completion:^{
        NSLog(@"Alert Complete");
    }];
}

- (void)openAddContactVC
{
    UIStoryboard* main = [UIStoryboard storyboardWithName:@"MainVC" bundle:nil];

    AddContactViewController* addVC = [main instantiateViewControllerWithIdentifier:@"AddContact"];
    addVC.modalPresentationStyle = UIModalPresentationPageSheet;
    addVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self showViewController:addVC sender:self];
    [self showDetailViewController:addVC sender:self];
}

- (void)openAddFavoriteVC
{
    UIStoryboard* main = [UIStoryboard storyboardWithName:@"MainVC" bundle:nil];
    
    UINavigationController* navVC = [main instantiateViewControllerWithIdentifier:@"AddFavo"];
    navVC.modalPresentationStyle = UIModalPresentationFormSheet;
    navVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navVC animated:YES completion:^{
        NSLog(@"Add Favo competion");
    }];

}

- (IBAction)showSideBar:(id)sender {
    MainViewController *rootViewController = (MainViewController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController toggleSideBar];
}

@end
