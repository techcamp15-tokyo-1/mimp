//
//  JanreTableViewCell.h
//  SidebarDemo
//
//  Created by fixedpoint on 8/26/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JanreIndexedCollectionView.h"

static NSString *CollectionViewCellIdentifier = @"JanreCollectionViewCellIdentifier";

@interface JanreTableViewCell : UITableViewCell
@property (nonatomic, strong) JanreIndexedCollectionView *collectionView;

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSInteger)index;

@end
