//
//  TPTVerticalCollectionView.m
//  CoverFlowMatrix
//
//  Created by saurabh sindhu on 30/04/13.
//  Copyright (c) 2013 saurabh sindhu. All rights reserved.

#import "TPTVerticalCollectionView.h"
#import "TPTCell.h"

#define kProjectCellIdentifier @"projectCellIdentifier"

@implementation TPTVerticalCollectionView

@synthesize collectionView;
@synthesize dataArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


-(void) setup
{
	dataArray = [NSArray array];
	
	self.backgroundColor = [UIColor clearColor];
	
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(180, 180)];
    
   // [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
	
	collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 210, self.frame.size.height) collectionViewLayout:flowLayout];

	[self.collectionView registerClass:[TPTCell class] forCellWithReuseIdentifier:kProjectCellIdentifier];
	
	collectionView.showsHorizontalScrollIndicator = NO;
	collectionView.showsVerticalScrollIndicator = NO;
	
	collectionView.dataSource = self;
	collectionView.delegate = self;
	
	collectionView.backgroundColor = [UIColor clearColor];
	
	[self addSubview:collectionView];	
}

-(void) setDataArray:(NSArray *)aDataArray
{
	dataArray = aDataArray;
	[self.collectionView reloadData];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [dataArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = kProjectCellIdentifier;
	TPTCell *cell = (TPTCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
	
	NSString *cellData = [dataArray objectAtIndex:indexPath.row];

	[cell.cellImage setImage:[UIImage imageNamed:cellData]];
	
	return cell;
	
}

@end
