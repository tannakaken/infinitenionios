//
//  ViewController.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "ViewController.h"
#import "SuperComplex.h"

@interface ViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;
@property (nonatomic) NSMutableArray<NSString *> *historyArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.historyArray = [NSMutableArray new];
    self.historyTableView.delegate = self;
    self.historyTableView.dataSource = self;
    self.inputTextField.delegate = self;
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

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArray.count;
}




@end
