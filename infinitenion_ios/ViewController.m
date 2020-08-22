//
//  ViewController.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "ViewController.h"
#import "SuperComplex.h"
@import GoogleMobileAds;

@interface ViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;
@property (nonatomic) NSMutableArray<NSString *> *historyArray;
@property(nonatomic, strong) GADBannerView *bannerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.historyArray = [NSMutableArray new];
    self.historyTableView.delegate = self;
    self.historyTableView.dataSource = self;
    self.inputTextField.delegate = self;
#if GOOGLE_API_ENABLED
    self.bannerView = [[GADBannerView alloc]
        initWithAdSize:kGADAdSizeBanner];
    [self addBannerViewToView:self.bannerView];
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    //self.bannerView.adUnitID = @"ca-app-pub-2965415045499808/5432997419";
    self.bannerView.rootViewController = self;
#endif
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.inputTextField resignFirstResponder];
    return YES;
}

- (IBAction)calc:(id)sender {
    NSString *inputText = self.inputTextField.text;
    id<SuperComplex> c = SuperComplexFromString(inputText);
    NSString *result;
    if (c == nil) {
        result = @"エラー";
        self.inputTextField.text = @"";
    } else {
        result = c.description;
        self.inputTextField.text = result;
    }
    NSString *history = [NSString stringWithFormat:@"%@\n%@", inputText, result];
    [self.historyArray insertObject:history atIndex:0];
    [self.historyTableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"HistoryCell";
    UITableViewCell *cell = [self.historyTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"HistoryCell"];
    }
    NSString *history = self.historyArray[indexPath.row];
    NSArray<NSString *> *parsed = [history componentsSeparatedByString:@"\n"];
    cell.textLabel.text = parsed[0];
    cell.detailTextLabel.text = parsed[1];
    if ([cell.detailTextLabel.text isEqualToString:@"エラー"]) {
        cell.detailTextLabel.textColor = UIColor.redColor;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *history = self.historyArray[indexPath.row];
    NSArray<NSString *> *parsed = [history componentsSeparatedByString:@"\n"];
    self.inputTextField.text = parsed[0];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.historyArray removeObjectAtIndex:indexPath.row];
        [self.historyTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArray.count;
}

- (void)addBannerViewToView:(UIView *)bannerView {
  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:bannerView];
  [self.view addConstraints:@[
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.bottomLayoutGuide
                               attribute:NSLayoutAttributeTop
                              multiplier:1
                                constant:0],
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeCenterX
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view
                               attribute:NSLayoutAttributeCenterX
                              multiplier:1
                                constant:0]
                                ]];
}


@end
