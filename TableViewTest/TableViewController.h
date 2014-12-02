//
//  ViewController.h
//  TableViewTest
//
//  Created by Alvin Sun on 2014-12-01.
//  Copyright (c) 2014 Alvin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UITableView *serachBar;
@property(strong,nonatomic) NSArray *listTeams;
@property(strong,nonatomic) NSMutableArray *listFilterTeams;

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSUInteger)scope;
@end

