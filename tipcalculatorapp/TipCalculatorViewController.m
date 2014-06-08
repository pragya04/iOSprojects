//
//  TipCalculatorViewController.m
//  tipcalculatorapp
//
//  Created by Pragya  Pherwani on 6/2/14.
//  Copyright (c) 2014 Pragya  Pherwani. All rights reserved.
//
#import "TipCalculatorViewController.h"
#import "SettingsViewController.h"

@interface TipCalculatorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void) updateValues;

@end

@implementation TipCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void) updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.total.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"default_tip_value"];
    self.tipControl.selectedSegmentIndex = defaultTipIndex;

}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}
@end
