//
//  ViewController.m
//  infinitenion_ios
//
//  Created by Kensaku Tanaka on 2019/05/31.
//  Copyright © 2019 Kensaku Tanaka. All rights reserved.
//

#import "ViewController.h"
#import "SuperComplex.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.inputTextField resignFirstResponder];
    return YES;
}

- (IBAction)calc:(id)sender {
    NSString *inputText = self.inputTextField.text;
    id<SuperComplex> c = SuperComplexFromString(inputText);
    _inputTextField.text = c.description;
}


@end
