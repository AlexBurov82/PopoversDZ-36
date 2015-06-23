//
//  ViewController.m
//  PopoversDZ-36
//
//  Created by Александр on 05.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import "ABTableViewController.h"
#import "ABPopoverContentsViewController.h"
#import "ABDatePickerViewController.h"
#import "ABEducationTableViewController.h"
#import "ABLogViewController.h"




@interface ABTableViewController () <UIPopoverControllerDelegate, UITextFieldDelegate, ABDatePickerViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *popover;

@property (strong, nonatomic) UIPopoverController *popoverDatePicker;

@property (strong, nonatomic) UIPopoverController *popoverEducation;

@end



typedef enum {
    
    ABGenderTypeMale,
    ABGenderTypFemail
    
} ABGenderType;



static NSString *kSettingsFirstName   = @"firstName";
static NSString *kSettingsLastName    = @"lastName";
static NSString *kSettingsGender      = @"gender";
static NSString *kSettingsDateOfBirth = @"dateOfBirth";
static NSString *kSettingsEducation   = @"education";


@implementation ABTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettings];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Seve and Load

- (void)saveSettings {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.firstNameTextField.text forKey:kSettingsFirstName];
    [userDefaults setObject:self.lastNameTextField.text forKey:kSettingsLastName];
    [userDefaults setInteger:self.genderSegmentedcontrol.selectedSegmentIndex forKey:kSettingsGender];
    [userDefaults setObject:self.educationTextField.text forKey:kSettingsEducation];
    
    [userDefaults synchronize];
}

- (void) saveSettingsDateOfBirth:(NSDate*)date {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:date forKey:kSettingsDateOfBirth];
    [userDefaults synchronize];
}

- (void) loadSettings {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.firstNameTextField.text = [userDefaults objectForKey:kSettingsFirstName];
    self.lastNameTextField.text = [userDefaults objectForKey:kSettingsLastName];
    self.genderSegmentedcontrol.selectedSegmentIndex = [userDefaults boolForKey:kSettingsGender];
    
    self.dateOfBirthTextField.text = [self dateFormatString:
                                      [userDefaults objectForKey:kSettingsDateOfBirth]];
    
    self.educationTextField.text = [userDefaults objectForKey:kSettingsEducation];
}

#pragma mark - Actions

- (IBAction)logAction:(id)sender {
    
    if (self.firstNameTextField.text.length > 0 && self.lastNameTextField.text.length > 0 &&
        self.dateOfBirthTextField.text.length > 0 && self.educationTextField.text.length > 0) {
        
        ABLogViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ABLogViewController"];
        
        
        lvc.logUserDataArray = [self logUserData];
        
        
        
        [self presentViewController:lvc
                           animated:YES
                         completion:nil];
        NSLog(@"%@", [self logUserData]);
    }
    
}

- (NSArray*)logUserData {
    
    NSString *firstNameString = [NSString stringWithFormat:@"First name: %@", self.firstNameTextField.text];
    NSString *lastNameString = [NSString stringWithFormat:@"Last name:: %@", self.lastNameTextField.text];
    NSString *genderString = [NSString stringWithFormat:@"Gender: %@", [self genderString]];
    NSString *dateOfBirthString = [NSString stringWithFormat:@"Date of birth: %@", self.dateOfBirthTextField.text];
    NSString *educationString = [NSString stringWithFormat:@"Education: %@", self.educationTextField.text];

    NSArray *logUserDataArray = [NSArray arrayWithObjects:firstNameString, lastNameString, genderString, dateOfBirthString, educationString, nil];
   
    
    return logUserDataArray;

}

- (NSString *)genderString {
    
    if (self.genderSegmentedcontrol.selectedSegmentIndex == ABGenderTypeMale) {
        return @"Male";
    } else {
        return @"Female";
    }
    
}



- (IBAction)actionTextChanged:(UITextField*)sender {
    
    [self saveSettings];
}

- (IBAction)actionValueChanged:(UISegmentedControl*)sender {
    
    [self saveSettings];
}

- (void)showControllerAsModal:(UIViewController *)vc {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav
                       animated:YES
                     completion:nil];
    
}

- (void)showController:(UIViewController*)vc inPopoverFromSender:(id)sender {
    
    if (!sender) {
        return;
    }
    
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    popover.popoverContentSize = CGSizeMake(300, 340);
    popover.backgroundColor = [UIColor lightGrayColor];
    
    popover.delegate = self;
    
    self.popover = popover;
    
    [popover presentPopoverFromBarButtonItem:sender
                    permittedArrowDirections:UIPopoverArrowDirectionAny
                                    animated:NO];
    
}



- (IBAction)infoAction:(UIBarButtonItem*)sender {
    
    ABPopoverContentsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ABPopoverContentsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [self showController:vc inPopoverFromSender:sender];
        
    } else {
        
        [self showControllerAsModal:vc];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSInteger nextTag = textField.tag + 1;
    
    UIResponder* nextResponder = [self.tableView viewWithTag:nextTag];
    
    if (nextResponder) {
        
        [nextResponder becomeFirstResponder];
        
    } else {
        
        [textField resignFirstResponder];
    }
    
    return NO;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *) textField {
    
    ABDatePickerViewController *dpvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ABDatePickerViewController"];

    
    ABEducationTableViewController *etvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ABEducationTableViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        UIPopoverController *popoverDatePicker = [[UIPopoverController alloc] initWithContentViewController:dpvc];
        
        popoverDatePicker.delegate = self;
        
        UIPopoverController *popoverEducation = [[UIPopoverController alloc] initWithContentViewController:etvc];
        
        popoverEducation.delegate = self;
        
        if (textField == self.dateOfBirthTextField) {
            [popoverDatePicker presentPopoverFromRect:textField.bounds
                                               inView:textField
                             permittedArrowDirections:UIPopoverArrowDirectionUp
                                             animated:YES];
            
            [dpvc.datePicker addTarget:self
                                action:@selector(outputTextField:)
                      forControlEvents:UIControlEventValueChanged];
            
            self.popoverDatePicker = popoverDatePicker;
            
            return NO;
            
        } else if (textField == self.educationTextField) {
            [popoverEducation presentPopoverFromRect:textField.bounds
                                              inView:textField
                            permittedArrowDirections:UIPopoverArrowDirectionUp
                                            animated:YES];
            
            etvc.delegate = self;
            
            NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *levelEducationString = [userDefaults objectForKey:kSettingsEducation];
            etvc.levelEducationString = levelEducationString;
            
            self.popoverEducation = popoverEducation;
            
            
            return NO;
        }

    } else {
        
        if (textField == self.dateOfBirthTextField) {
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:dpvc];
            
            dpvc.navigationItem.title = @"Date of birth";
            
            [self presentViewController:nav
                               animated:YES
                             completion:nil];
            
            dpvc.delegate = self;
            
            NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
            NSDate *dateOfBirth = [userDefaults objectForKey:kSettingsDateOfBirth];
            
            dpvc.date = dateOfBirth;
            
            return NO;
            
        } else if (textField == self.educationTextField) {
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:etvc];
            
            etvc.navigationItem.title = @"Education";
            
            [self presentViewController:nav
                               animated:YES
                             completion:nil];
            
            etvc.delegate = self;
            
            NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *levelEducationString = [userDefaults objectForKey:kSettingsEducation];
            etvc.levelEducationString = levelEducationString;
            
            return NO;
        }
    }
    
    return YES;
}

- (NSString*)dateFormatString:(NSDate*)date {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    
    return [formatter stringFromDate:date];
}


- (void)outputTextField:(id)sender {
    
    NSDate * dateSelected = ((UIDatePicker *)sender).date;
    
    self.dateOfBirthTextField.text = [self dateFormatString:dateSelected];
    
    self.dateOfBirthTextField.textColor = [UIColor blackColor];
    
    [self saveSettingsDateOfBirth:dateSelected];
}

- (void)selectingDateInDatePicker:(NSDate *)date {
    
    self.dateOfBirthTextField.text = [self dateFormatString:date];
    
    [self saveSettingsDateOfBirth:date];
}

- (void)choiceOfEducation:(NSString *)levelEducationString {
    
    self.educationTextField.text = levelEducationString;
    
    [self saveSettings];
}

#pragma mark - UIPopoverControllerDelegate 

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
    if (self.popover) {
        self.popover = nil;
    } else if (self.popoverDatePicker) {
        self.popoverDatePicker = nil;
    } else if (self.popoverEducation) {
        self.popoverEducation = nil;
    }
    
}


@end


