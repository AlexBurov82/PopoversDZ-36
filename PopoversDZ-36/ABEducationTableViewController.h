//
//  ABEducationTableViewController.h
//  PopoversDZ-36
//
//  Created by Александр on 08.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ABEducationTableViewControllerDelegate;



@interface ABEducationTableViewController : UITableViewController

@property (strong, nonatomic) NSString *levelEducationString;

@property (weak, nonatomic) id <ABEducationTableViewControllerDelegate> delegate;

- (IBAction)okAction:(id)sender;



@end

@protocol ABEducationTableViewControllerDelegate <NSObject>

- (void)choiceOfEducation:(NSString*)levelEducationString;

@end