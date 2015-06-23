//
//  ABLogViewController.h
//  PopoversDZ-36
//
//  Created by Александр on 10.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABTableViewController.h"

@interface ABLogViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirthTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;

@property (strong, nonatomic) NSArray *logUserDataArray;

@end

