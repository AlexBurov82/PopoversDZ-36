//
//  ABEducationTableViewController.m
//  PopoversDZ-36
//
//  Created by Александр on 08.06.15.
//  Copyright (c) 2015 Alex Bukharov. All rights reserved.
//

#import "ABEducationTableViewController.h"

#import "ABTableViewController.h"



@interface ABEducationTableViewController ()

@property (strong, nonatomic) NSArray *levelEducationArray;
@property (nonatomic, retain) NSIndexPath* checkedIndexPath;
@property (nonatomic, retain) NSIndexPath* checkedIndexPathDefault;


@end

@implementation ABEducationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.levelEducationArray = @[@"Incomplete  elementary education", @"Elementary education", @"Incomplete secondary education", @"Secondary education", @"Higher education", @"Incomplete higher education"];
    
    self.checkedIndexPath = [NSIndexPath indexPathForRow:[self.levelEducationArray indexOfObject:self.levelEducationString] inSection:0];
    
    
    
    self.checkedIndexPathDefault = [NSIndexPath indexPathForRow:4 inSection:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    NSLog(@"ABEducationTableViewController deallocated");
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.levelEducation.count;
    return self.levelEducationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    /*
    if([self.checkedIndexPathDefault isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else
    */
    if([self.checkedIndexPath isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [self.levelEducationArray objectAtIndex:indexPath.row];

    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.checkedIndexPath) {
        UITableViewCell* uncheckCell = [tableView cellForRowAtIndexPath:self.checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if ([self.checkedIndexPath isEqual:indexPath]) {
        self.checkedIndexPath = nil;
        self.levelEducationString = nil;
        
    } else {
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedIndexPath = indexPath;
        
        self.levelEducationString = [self.levelEducationArray objectAtIndex:indexPath.row];

    }
}

- (IBAction)okAction:(id)sender {
    
    if (self.levelEducationString.length > 0) {
        [self.delegate choiceOfEducation:self.levelEducationString];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
    
        [self.delegate choiceOfEducation:[NSString stringWithFormat:@"%@", [self.levelEducationArray objectAtIndex:4]]];
    
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
