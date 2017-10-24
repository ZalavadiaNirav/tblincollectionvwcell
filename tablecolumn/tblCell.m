//
//  tblCell.m
//  tablecolumn
//
//  Created by Gaurav Amrutiya on 06/10/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import "tblCell.h"
#import "collectionCell.h"



@implementation tblCell

@synthesize height,heightDelegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _collectionVw.dataSource=self;
    _collectionVw.delegate=self;
    height=0.0;

    
//    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)self.collectionVw.collectionViewLayout;
//    
//    // Configure the collectionView
//    flow.minimumInteritemSpacing = 10.0;
//    
//    // This enables the magic of auto layout.
//    // Setting estimatedItemSize different to CGSizeZero
//    // on flow Layout enables auto layout for collectionView cells.
//    // https://developer.apple.com/videos/play/wwdc2014-226/
//    flow.estimatedItemSize = CGSizeMake(1, 1);
//    
//    // Disable the scroll on your collection view
//    // to avoid running into multiple scroll issues.
//    [self.collectionVw setScrollEnabled:NO];
    
   
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.height  = self.height+collectionView.contentSize.height;
    NSLog(@"height %f",self.height);
    [self.heightDelegate updatedCellHeight:self.height indexPath:indexPath];
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionCell *cell=(collectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCellID" forIndexPath:indexPath];
    cell.lbl1.text=@"hi";

    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
