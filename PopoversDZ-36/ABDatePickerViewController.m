//
//  ABDatePickerViewController.m
//  PopoversDZ-36
//
//  Created by Александр on 06.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import "ABDatePickerViewController.h"
#import "ABTableViewController.h"



@interface ABDatePickerViewController ()





@end

@implementation ABDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    NSLog(@"ABDatePickerViewController deallocated");
}

- (IBAction)okAction:(id)sender {
    
    [self.delegate selectingDateInDatePicker:self.datePicker.date];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
