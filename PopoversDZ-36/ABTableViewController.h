//
//  ViewController.h
//  PopoversDZ-36
//
//  Created by Александр on 05.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABDatePickerViewController.h"
#import "ABEducationTableViewController.h"





@interface ABTableViewController : UITableViewController <ABEducationTableViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentedcontrol;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;


- (IBAction)infoAction:(UIBarButtonItem*)sender;


@end
