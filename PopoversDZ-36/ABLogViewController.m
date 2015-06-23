//
//  ABLogViewController.m
//  PopoversDZ-36
//
//  Created by Александр on 10.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import "ABLogViewController.h"

@interface ABLogViewController ()

@end

static NSString *kUserDtaLabel = @"userDtaLabel";

@implementation ABLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstNameLabel.text = [NSString stringWithFormat:@"%@",[self.logUserDataArray objectAtIndex:0]];
    self.lastNameLabel.text = [NSString stringWithFormat:@"%@",[self.logUserDataArray objectAtIndex:1]];
    self.genderLabel.text = [NSString stringWithFormat:@"%@",[self.logUserDataArray objectAtIndex:2]];
    self.dateOfBirthTextLabel.text = [NSString stringWithFormat:@"%@",[self.logUserDataArray objectAtIndex:3]];
    self.educationLabel.text = [NSString stringWithFormat:@"%@",[self.logUserDataArray objectAtIndex:4]];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    NSLog(@"ABLogViewController deallocated");
}

- (IBAction)okAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
