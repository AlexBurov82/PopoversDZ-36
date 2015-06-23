//
//  ABDatePickerViewController.h
//  PopoversDZ-36
//
//  Created by Александр on 06.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol ABDatePickerViewControllerDelegate;


@interface ABDatePickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) id <ABDatePickerViewControllerDelegate> delegate;

@property (strong, nonatomic) NSDate *date;





@end

@protocol ABDatePickerViewControllerDelegate <NSObject>

- (void)selectingDateInDatePicker:(NSDate *)date;

@end