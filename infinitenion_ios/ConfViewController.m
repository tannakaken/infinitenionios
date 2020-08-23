//
//  ConfViewController.m
//  infinitenion_ios
//
//  Created by 田中健策 on 2020/08/23.
//  Copyright © 2020 Kensaku Tanaka. All rights reserved.
//

#import "ConfViewController.h"

@interface ConfViewController()
@property (weak, nonatomic) IBOutlet UISwitch *tutorialShowingSwitch;
@end

@implementation ConfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *ud = NSUserDefaults.standardUserDefaults;
    BOOL tutorialShowing = ![ud boolForKey:@"tutorialNotShowing"];
    self.tutorialShowingSwitch.on = tutorialShowing;
}

- (IBAction)mail:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:tannakaken@gmail.com"]
                                       options:@{} completionHandler:nil];
}

- (IBAction)webPage:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://tannakaken.xyz"]
    options:@{} completionHandler:nil];
}

- (IBAction)dojinPage:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://forcing.nagoya"]
    options:@{} completionHandler:nil];
}


- (IBAction)novel:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://tannakaken.xyz/novels/HamiltonsDream"]
    options:@{} completionHandler:nil];
}

- (IBAction)changeTutorialShowing:(id)sender {
    NSUserDefaults *ud = NSUserDefaults.standardUserDefaults;
    [ud setBool:!self.tutorialShowingSwitch.on forKey:@"tutorialNotShowing"];
}


@end
