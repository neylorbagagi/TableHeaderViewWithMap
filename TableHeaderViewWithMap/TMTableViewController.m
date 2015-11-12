//
//  TMTableViewController.m
//  TableHeaderViewWithMap
//
//  Created by Neylor Bagagi on 11/12/15.
//  Copyright © 2015 Neylor Bagagi. All rights reserved.
//

#import "TMTableViewController.h"

@interface TMTableViewController () <UIScrollViewDelegate>

@end

@implementation TMTableViewController{
    CGRect mapViewFrame;
    UIView *tableHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    
    mapViewFrame = CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height/3);
    
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
    
    CGRect mapViewFrameOnDrag = mapViewFrame;
    mapViewFrameOnDrag.origin.y = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y < -30
        & tableHeaderView.frame.size.height != self.tableView.frame.size.height/1.2) {
        
        NSLog(@"TableHeaderView.height: %f | TableView.height: %f",
              tableHeaderView.frame.size.height, self.tableView.frame.size.height/1.2);
        
        NSLog(@"MINOR 0 scroll: %f",scrollView.contentOffset.y);
        
        mapViewFrameOnDrag.size.height = self.tableView.frame.size.height/1.2;
        
        [tableHeaderView setFrame:mapViewFrameOnDrag];
        [tableHeaderView setBackgroundColor:[UIColor greenColor]];
        
        [self.tableView setTableHeaderView:tableHeaderView];
    }else if (scrollView.contentOffset.y > 30
              & tableHeaderView.frame.size.height > self.tableView.frame.size.height/3){
        
        NSLog(@"MAJOR 0 scroll: %f",scrollView.contentOffset.y);
        
        //mapViewFrameOnDrag.size.height = self.tableView.frame.size.height/3;
        
        [tableHeaderView setFrame:mapViewFrame];
        [tableHeaderView setBackgroundColor:[UIColor redColor]];
        
        [self.tableView setTableHeaderView:tableHeaderView];
        
    }else{
        
        
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
