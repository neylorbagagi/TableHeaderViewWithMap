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
    
    _tableHeaderViewMinSize = 300;
    _tableHeaderViewMaxSize = 450;
    _tableHeaderViewResizeResistence = 50;
    
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
    
    CGRect mapViewFrameOnDrag = mapViewFrame;
    mapViewFrameOnDrag.origin.y = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y < -_tableHeaderViewResizeResistence
        & tableHeaderView.frame.size.height != _tableHeaderViewMaxSize) {

        mapViewFrameOnDrag.size.height = _tableHeaderViewMaxSize;

        [UIView transitionWithView:tableHeaderView duration:2.0f options:UIViewAnimationOptionAllowAnimatedContent
                        animations:^{
                            [tableHeaderView setBackgroundColor:[UIColor greenColor]];
                        } completion:nil];
        
        [tableHeaderView setFrame:mapViewFrameOnDrag];
        [self.tableView setTableHeaderView:tableHeaderView];
        [self.tableView.tableHeaderView setFrame:mapViewFrameOnDrag];

        
        
    }else if (scrollView.contentOffset.y > _tableHeaderViewResizeResistence
              & tableHeaderView.frame.size.height > _tableHeaderViewMinSize){
        
        mapViewFrameOnDrag.size.height = _tableHeaderViewMinSize;
        
        [UIView transitionWithView:tableHeaderView duration:2.0f options:UIViewAnimationOptionAllowAnimatedContent
                        animations:^{
                            [tableHeaderView setBackgroundColor:[UIColor redColor]];
                        } completion:nil];

        
        [tableHeaderView setFrame:mapViewFrameOnDrag];
        [self.tableView setTableHeaderView:tableHeaderView];
        [self.tableView.tableHeaderView setFrame:mapViewFrameOnDrag];

        
    }else{
        // aqui provavelmente vai o trecho que fixa a tableHeaderView no topo
        
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
