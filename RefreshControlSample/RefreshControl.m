//
//  ViewController.m
//  RefreshControlSample
//
//  Created by Alvin Sun on 2014-12-02.
//  Copyright (c) 2014 Alvin Sun. All rights reserved.
//

#import "RefreshControl.h"

@interface RefreshControl ()

@end

@implementation RefreshControl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.logs = [[NSMutableArray alloc]init];
    NSDate *date = [[NSDate alloc] init];
    [self.logs addObject:date];
    // Initial UIRefreshControl
    UIRefreshControl *rc = [[UIRefreshControl alloc]init];
    rc.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = rc;
}

- (void) refreshTableView{
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Loading.."];
        NSDate *date = [[NSDate alloc]init];
        
        [self performSelector:@selector(callbackMethod:) withObject:date afterDelay:0];
    }
}

- (void)callbackMethod:(id) obj{
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    //[self.logs addObject:(NSDate*)obj];
    [self.logs insertObject:(NSDate*)obj atIndex:0];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.logs count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDateFormatter *dataformat = [[NSDateFormatter alloc]init];
    [dataformat setDateFormat:@"yyyy-mm-dd HH:mm:ss zzz"];
    
    cell.textLabel.text = [dataformat stringFromDate:[self.logs objectAtIndex:[indexPath row]]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
