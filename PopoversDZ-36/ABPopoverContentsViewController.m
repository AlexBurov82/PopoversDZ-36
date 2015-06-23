//
//  ABPopoverContentsViewController.m
//  PopoversDZ-36
//
//  Created by Александр on 06.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import "ABPopoverContentsViewController.h"

@interface ABPopoverContentsViewController ()

@end

@implementation ABPopoverContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    NSLog(@"ABPopoverContentsViewController deallocated");
}

- (IBAction)cancelAction:(UIBarButtonItem*)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
