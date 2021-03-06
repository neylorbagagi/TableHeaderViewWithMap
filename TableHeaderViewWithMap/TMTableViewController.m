//
//  TMTableViewController.m
//  TableHeaderViewWithMap
//
//  Created by Neylor Bagagi on 11/12/15.
//  Copyright © 2015 Neylor Bagagi. All rights reserved.
//

#import "TMTableViewController.h"
#import "TMTableHeaderViewResizable.h"

@interface TMTableViewController () <UIScrollViewDelegate>

@end

@implementation TMTableViewController{
    CGRect mapViewFrame;
    UIView *tableHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    
    _tableHeaderViewMinSize = 300;
    _tableHeaderViewMaxSize = 500;
    
    mapViewFrame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y,
                              self.tableView.frame.size.width, _tableHeaderViewMinSize);
    
    tableHeaderView = [[UIView alloc]initWithFrame:mapViewFrame];
    [tableHeaderView setBackgroundColor:[UIColor grayColor]];
    
    [self.tableView setTableHeaderView:tableHeaderView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // ISSUE: "tableHeaderViewResizeOnScroll" W R O N G  N A M E  F O R  M E T H O D  A N D  C L A S S E
    // ISSUE: "tableHeaderViewResizeOnScroll" M E T H O D  S H O U L D  R E T U R N  A  T A B L E V I E W  ? ? ?
    
    /*  E X A M P L E  W I T H  M E T H O D  I M P L A M E N T A T I O N
    TMTableHeaderViewResizable *TableHeaderViewResizable = [[TMTableHeaderViewResizable alloc]init];
    self.tableView = [TableHeaderViewResizable tableHeaderViewResizeOnScroll:tableHeaderView
                                                  tableHeaderViewMinimumSize:_tableHeaderViewMinSize
                                                  tableHeaderViewMaximumSize:_tableHeaderViewMaxSize
                                                          tableViewContainer:self.tableView
                                                             tableViewScroll:scrollView];
     */
    
    // E X A M P L E  W I T H  S T R U C T U R E D  I M P L A M E N T A T I O N
    CGRect mapViewFrameOnDrag = mapViewFrame;
    mapViewFrameOnDrag.origin.y = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y < 0
        & tableHeaderView.frame.size.height <= _tableHeaderViewMaxSize) {

        mapViewFrameOnDrag.size.height = (int)tableHeaderView.frame.size.height + (int)-scrollView.contentOffset.y;
        
        [tableHeaderView setFrame:mapViewFrameOnDrag];
        [self.tableView setTableHeaderView:tableHeaderView];
        [self.tableView.tableHeaderView setFrame:mapViewFrameOnDrag];

        if (tableHeaderView.frame.size.height >= _tableHeaderViewMaxSize) {
            [self.tableView setBounces:NO];
        }
        
    }else if (scrollView.contentOffset.y > 0
              & tableHeaderView.frame.size.height >= _tableHeaderViewMinSize){
        [self.tableView setBounces:YES];
    
        mapViewFrameOnDrag.size.height = (int)tableHeaderView.frame.size.height - (int)scrollView.contentOffset.y;
        
        [tableHeaderView setFrame:mapViewFrameOnDrag];
        [self.tableView setTableHeaderView:tableHeaderView];
        [self.tableView.tableHeaderView setFrame:mapViewFrameOnDrag];

        
    }else{
        // exeptions
        
    }
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    return cell;
}

@end
