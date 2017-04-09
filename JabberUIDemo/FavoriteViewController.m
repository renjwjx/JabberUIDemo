//
//  FavoriteViewController.m
//  JabberUIDemo
//
//  Created by jinren on 3/26/17.
//  Copyright © 2017 jinren. All rights reserved.
//

#import "FavoriteViewController.h"

@interface FavoriteViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    NSLog(@"Favo willTransitionToTraitCollection: %@", newCollection);
    if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        self.imgAvatar.hidden = YES;
    } else {
        self.imgAvatar.hidden = NO;
    }

}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"Favo viewWillTransitionToSize: %@", NSStringFromCGSize(size));
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    NSLog(@"Favo traitCollectionDidChange: %@", previousTraitCollection);
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
