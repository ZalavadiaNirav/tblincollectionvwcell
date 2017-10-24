//
//  tblCell.h
//  tablecolumn
//
//  Created by Gaurav Amrutiya on 06/10/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol setCellHeigthProtocol <NSObject>

-(void)updatedCellHeight:(CGFloat)height indexPath:(NSIndexPath *)ind;

@end

@interface tblCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    CGFloat height;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionVw;
@property (nonatomic,readwrite) CGFloat height;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightConstraint;
@property (weak) id <setCellHeigthProtocol> heightDelegate;
@end
