//
//  TMTableHeaderViewResizable.h
//  TableHeaderViewWithMap
//
//  Created by Neylor Bagagi on 11/13/15.
//  Copyright © 2015 Neylor Bagagi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TMTableHeaderViewResizable : NSObject

- (UITableView *)tableHeaderViewResizeOnScroll:(UIView *)view
                    tableHeaderViewMinimumSize:(float)minimumViewSize
                    tableHeaderViewMaximumSize:(float)maximumViewSize
                            tableViewContainer:(UITableView *)tableView
                               tableViewScroll:(UIScrollView *)scrollView;

@end
