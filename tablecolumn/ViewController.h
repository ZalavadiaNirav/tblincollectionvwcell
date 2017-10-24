//
//  ViewController.h
//  tablecolumn
//
//  Created by Gaurav Amrutiya on 06/10/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tblCell.h"

@class setCellHeigthProtocol;
@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,setCellHeigthProtocol>

@property (weak, nonatomic) IBOutlet UITableView *tbl;

@end

