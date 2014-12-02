//
//  ViewController.h
//  DeleteAddCell
//
//  Created by Alvin Sun on 2014-12-02.
//  Copyright (c) 2014 Alvin Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteAddCell : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UITextField *txtField;

@property (weak, nonatomic) IBOutlet UINavigationItem *navgationItem;

@property(strong,nonatomic) NSMutableArray *listTeams;
@end

