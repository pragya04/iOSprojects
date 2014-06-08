//
//  SettingsViewController.m
//  tipcalculatorapp
//
//  Created by Pragya  Pherwani on 6/7/14.
//  Copyright (c) 2014 Pragya  Pherwani. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSelected;
- (IBAction)defaultTipChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipValueLabel;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"default_tip_value"];
    
    self.defaultTipSelected.selectedSegmentIndex = defaultTipIndex;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)defaultTipChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    int segmentIndex = self.defaultTipSelected.selectedSegmentIndex;
    
    [defaults setInteger:segmentIndex forKey:@"default_tip_value"];
    self.defaultTipValueLabel.text = [self.defaultTipSelected titleForSegmentAtIndex:segmentIndex];
    [defaults synchronize];
    
}
@end
