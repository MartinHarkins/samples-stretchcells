//
//  SCViewController.h
//  StretchCells
//
//  Created by Martin Harkins on 5/16/13.
//  Copyright (c) 2013 Martin Harkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

#pragma mark -
#pragma mark UITableViewDelegate
- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

#pragma mark -
#pragma mark UITableViewDataSource
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
