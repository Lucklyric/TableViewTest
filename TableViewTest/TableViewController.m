//
//  ViewController.m
//  TableViewTest
//
//  Created by Alvin Sun on 2014-12-01.
//  Copyright (c) 2014 Alvin Sun. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableCell.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"events" ofType:@"plist"];
    self.listTeams = [[NSArray alloc]initWithContentsOfFile:plistPath];
    NSLog(@"%d",self.listTeams.count);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.listTeams count];
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CellIdentifier";
    NSLog(@"runhere");
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [self.listTeams objectAtIndex:row];
    cell.mLabel.text = [rowDict objectForKey:@"name"];
    
    NSString *imagePath = [rowDict objectForKey:@"image"];
    cell.mImage.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


@end
