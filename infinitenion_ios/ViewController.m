//
//  ViewController.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "ViewController.h"
#import "SuperComplex.h"

#if GOOGLE_API_ENABLED
@import GoogleMobileAds;
#endif

@interface ViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;

@property (nonatomic) NSMutableArray<NSString *> *historyArray;
#if GOOGLE_API_ENABLED
@property(nonatomic, strong) GADBannerView *bannerView;
#endif
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.historyArray = [NSMutableArray new];
    [self loadHistory];
    self.historyTableView.delegate = self;
    self.historyTableView.dataSource = self;
    self.inputTextField.delegate = self;
    NSString *title = [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] localizedStringForKey:@"Edit" value:@"" table:nil];
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithTitle:title
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(edit)];
    self.navigationItem.leftBarButtonItem = editButton;
    
    
#if GOOGLE_API_ENABLED
    self.bannerView = [[GADBannerView alloc]
        initWithAdSize:kGADAdSizeBanner];
    [self addBannerViewToView:self.bannerView];
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    //self.bannerView.adUnitID = @"ca-app-pub-2965415045499808/5432997419";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
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
    NSString *history = [NSString stringWithFormat:@"%@\t%@", inputText, result];
    [self addHistory:history];
}

- (void)addHistory:(NSString *)history {
    if (self.historyArray.count > 99) {
        [self.historyArray removeLastObject];
    }
    [self.historyArray insertObject:history atIndex:0];
    [self saveHistory];
    [self.historyTableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"HistoryCell";
    UITableViewCell *cell = [self.historyTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"HistoryCell"];
    }
    NSString *history = self.historyArray[indexPath.row];
    NSArray<NSString *> *parsed = [history componentsSeparatedByString:@"\t"];
    cell.textLabel.text = parsed[0];
    cell.detailTextLabel.text = parsed[1];
    if ([cell.detailTextLabel.text isEqualToString:@"エラー"]) {
        cell.detailTextLabel.textColor = UIColor.redColor;
    } else {
        cell.detailTextLabel.textColor = UIColor.blackColor;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *history = self.historyArray[indexPath.row];
    NSArray<NSString *> *parsed = [history componentsSeparatedByString:@"\t"];
    self.inputTextField.text = parsed[0];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.historyArray removeObjectAtIndex:indexPath.row];
        [self saveHistory];
        [self.historyTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *history = self.historyArray[sourceIndexPath.row];
    self.historyArray[sourceIndexPath.row] = self.historyArray[destinationIndexPath.row];
    self.historyArray[destinationIndexPath.row] = history;
    [self saveHistory];
    [self.historyTableView reloadData];
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArray.count;
}

- (IBAction)edit {
    [self.historyTableView setEditing:!self.historyTableView.isEditing animated:YES];
    if (self.historyTableView.isEditing) {
        
    }
    NSString *title = [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"]
                       localizedStringForKey:self.historyTableView.isEditing ? @"Done" : @"Edit"
                       value:@""
                       table:nil];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]
                                   initWithTitle:title
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(edit)];
    self.navigationItem.leftBarButtonItem = button;
}

- (IBAction)gear:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)saveHistory {
    NSString *documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/history.txt"];
    NSData *data = [[self.historyArray componentsJoinedByString:@"\n"] dataUsingEncoding:NSUTF8StringEncoding];
    NSFileManager *manager = NSFileManager.defaultManager;
    [manager createFileAtPath:documentPath contents:data attributes:nil];
}

- (void)loadHistory {
    NSString *documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/history.txt"];
    NSData *data = [NSData dataWithContentsOfFile:documentPath];
    if (data) {
        NSString *historyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSArray<NSString *> *loadedHistoryArray = [historyString componentsSeparatedByString:@"\n"];
        [loadedHistoryArray enumerateObjectsUsingBlock:^(NSString *history, NSUInteger index, BOOL *stop) {
            [self.historyArray addObject:history];
        }];
    }
}

#if GOOGLE_API_ENABLED
- (void)addBannerViewToView:(UIView *)bannerView {
  bannerView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:bannerView];
  [self.view addConstraints:@[
    [NSLayoutConstraint constraintWithItem:bannerView
                               attribute:NSLayoutAttributeBottom
                               relatedBy:NSLayoutRelationEqual
                                  toItem:self.view.safeAreaLayoutGuide
                               attribute:NSLayoutAttributeBottom
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
#endif

@end
