//
//  SCViewController.m
//  StretchCells
//
//  Created by Martin Harkins on 5/16/13.
//  Copyright (c) 2013 Martin Harkins. All rights reserved.
//

#import "SCViewController.h"

#define kSCCellCount 30

@interface SCViewController ()
@property (readwrite, nonatomic) NSArray *myArray;

@end

@implementation SCViewController
@synthesize myArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (int i = 0; i  <kSCCellCount; i++) {
        [a addObject:[NSString stringWithFormat:@"Item %d", (i + 1)]];
    }
    
	// Do any additional setup after loading the view.
    myArray = a;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDelegate
- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Only one section
    return [self.myArray count];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *txt = [self.myArray objectAtIndex:indexPath.row];
    
    
    /*
     *   This is an important bit, it asks the table view if it has any available cells
     *   already created which it is not using (if they are offscreen), so that it can
     *   reuse them (saving the time of alloc/init/load from xib a new cell ).
     *   The identifier is there to differentiate between different types of cells
     *   (you can display different types of cells in the same table view)
     */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCResizingCell"];
    
    /*
     *   If the cell is nil it means no cell was available for reuse and that we should
     *   create a new one.
     */
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SCResizingCell"] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.textLabel.text = txt;
    return cell;
}
@end
