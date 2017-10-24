//
//  ViewController.m
//  tablecolumn
//
//  Created by Gaurav Amrutiya on 06/10/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import "ViewController.h"
#import "tblCell.h"
@interface ViewController ()
{
    CGFloat nwheight;
    NSMutableArray *heightArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    heightArr=[NSMutableArray new];
    _tbl.estimatedRowHeight = 140;

    _tbl.estimatedRowHeight=UITableViewAutomaticDimension;
    nwheight=0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (int i=0; i<[heightArr count]; i++)
    {
        NSIndexPath *arrIndexpath=[[heightArr objectAtIndex:i] objectForKey:@"indexPath"];
        NSNumber *selRow = [[NSNumber alloc] initWithInteger:arrIndexpath.row];
        NSNumber *selSection = [[NSNumber alloc] initWithInteger:arrIndexpath.section];
        
        NSNumber *curRow = [[NSNumber alloc] initWithInteger:indexPath.row];
        NSNumber *curSection = [[NSNumber alloc] initWithInteger:indexPath.section];
        
        if([selRow isEqual:curRow] && [curSection isEqual:selSection])
        {
            CGFloat nHeight=[[[heightArr objectAtIndex:i] valueForKey:@"height"] doubleValue];
            return nHeight;
        }
    }

    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tblCell *cell=(tblCell *)[tableView dequeueReusableCellWithIdentifier:@"tblCellID"];
    cell.frame = tableView.bounds;

   [cell.collectionVw reloadData];
    cell.heightDelegate=self;
    cell.collectionViewHeightConstraint.constant = cell.collectionVw.collectionViewLayout.collectionViewContentSize.height;
    [cell layoutIfNeeded];
//

    NSLog(@"new height %f",cell.height);

    return cell;
}

-(void)updatedCellHeight:(CGFloat)height indexPath:(NSIndexPath *)ind
{
    NSIndexPath *path=ind;
    NSLog(@"pro height %f",height);
    
    NSNumber *selRow = [[NSNumber alloc] initWithInteger:ind.row];
    NSNumber *selSection = [[NSNumber alloc] initWithInteger:ind.section];
    
    NSNumber *height1=[[NSNumber alloc] initWithFloat:height];
    
    NSDictionary *heightDict=[[NSDictionary alloc] initWithObjectsAndKeys:selRow,@"row",selSection,@"section",height1,@"height", nil];
//    nwheight=height;
    [heightArr addObject:heightDict];
    if(path.row<2)
        [_tbl reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
