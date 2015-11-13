//
//  TMTableHeaderViewResizable.m
//  TableHeaderViewWithMap
//
//  Created by Neylor Bagagi on 11/13/15.
//  Copyright © 2015 Neylor Bagagi. All rights reserved.
//

#import "TMTableHeaderViewResizable.h"

@implementation TMTableHeaderViewResizable

- (UITableView *)tableHeaderViewResizeOnScroll:(UIView *)view
                    tableHeaderViewMinimumSize:(float)minimumViewSize
                    tableHeaderViewMaximumSize:(float)maximumViewSize
                            tableViewContainer:(UITableView *)tableView
                               tableViewScroll:(UIScrollView *)scrollView{
    
    CGRect mapViewFrameOnDrag = view.frame;
    mapViewFrameOnDrag.origin.y = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y < 0
        & view.frame.size.height <= maximumViewSize) {
        
        mapViewFrameOnDrag.size.height = (int)view.frame.size.height + (int)-scrollView.contentOffset.y;
        [view setFrame:mapViewFrameOnDrag];
        
        [tableView setTableHeaderView:view];
        [tableView.tableHeaderView setFrame:mapViewFrameOnDrag];
        
        if (view.frame.size.height >= maximumViewSize) {
            [tableView setBounces:NO];
        }
        
        return tableView;
        
    }else if (scrollView.contentOffset.y > 0
              & view.frame.size.height >= minimumViewSize){
        
        [tableView setBounces:YES];
        
        mapViewFrameOnDrag.size.height = (int)view.frame.size.height - (int)scrollView.contentOffset.y;
        [view setFrame:mapViewFrameOnDrag];
        
        [tableView setTableHeaderView:view];
        [tableView.tableHeaderView setFrame:mapViewFrameOnDrag];
        
        return tableView;
    }else{
        // exeptions
        return tableView;
    }
}


@end
