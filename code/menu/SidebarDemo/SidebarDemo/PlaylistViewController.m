//
//  PlaylistViewController.m
//  SidebarDemo
//
//  Created by fixedpoint on 8/23/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PlaylistViewController.h"
#import "JanreTableViewCell.h"

@interface PlaylistViewController ()
@property (nonatomic, strong) NSArray *keyItems;
@property (nonatomic, strong) NSArray *advertisementItems;
@property (nonatomic, strong) NSArray *moodItems;
@property (nonatomic, strong) NSArray *actionItems;
@property (nonatomic, strong) NSArray *placeItems;
@property (nonatomic, strong) NSArray *collectionViewArray;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;
@end

@implementation PlaylistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _keyItems = @[@"広告", @"気分", @"行動", @"場所"];
    _advertisementItems = @[@"CA", @"DeNA", @"GREE"];
    _moodItems = @[@"Angry", @"Chillout", @"Cool", @"Dark", @"Dramatic", @"Dramatic", @"Energetic", @"Funny", @"Futuristic", @"Groovy", @"Happy", @"intimate"];
    _actionItems = @[@"Walking", @"Running", @"Sleeping", @"Traveling", @"Workout", @"Party"];
    _placeItems = @[@"Cafe", @"Office", @"Sea", @"Mountain", @"Park", @"Home"];
    
    const NSInteger numberOfTableViewRows = [_keyItems count];
    NSInteger numberOfCollectionViewCells;
    NSMutableArray *mutableArray;
    NSMutableArray *collectionArray;
    mutableArray = [NSMutableArray arrayWithCapacity:numberOfTableViewRows];
    
    for (NSInteger tableViewRow = 0; tableViewRow < numberOfTableViewRows; tableViewRow++)
    {
        
         switch (tableViewRow) {
         case 0:
         collectionArray = [NSMutableArray arrayWithCapacity:[_advertisementItems count]];
         break;
         case 1:
         collectionArray = [NSMutableArray arrayWithCapacity:[_moodItems count]];
         break;
         case 2:
         collectionArray = [NSMutableArray arrayWithCapacity:[_actionItems count]];
         break;
         case 3:
         collectionArray = [NSMutableArray arrayWithCapacity:[_placeItems count]];
         break;
         }

        numberOfCollectionViewCells = [collectionArray count];
        for (NSInteger collectionViewItem = 0; collectionViewItem < numberOfCollectionViewCells; collectionViewItem++)
        {
            [collectionArray addObject:[collectionArray objectAtIndex:collectionViewItem]];
        }
        [mutableArray addObject:collectionArray];
    }
    
    self.collectionViewArray = [NSArray arrayWithArray:mutableArray];
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)move:(id)sender
{
    [self performSegueWithIdentifier:@"segue3" sender:self];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_keyItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(JanreTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self index:indexPath.row];
    NSInteger index = cell.collectionView.index;
    
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier;
    UITableViewCell *cell;
    
    NSString *key = [self.keyItems objectAtIndex:indexPath.section];
    CellIdentifier = key;
    if([key isEqualToString:@"広告"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell)
        {
            cell = [[JanreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    } else if ([key isEqualToString:@"気分"]){
        CellIdentifier = [self.moodItems objectAtIndex:indexPath.row];
        if (!cell)
        {
            cell = [[JanreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
    } else if ([key isEqualToString:@"行動"]){
        CellIdentifier = [self.actionItems objectAtIndex:indexPath.row];
        if (!cell)
        {
            cell = [[JanreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
    } else if ([key isEqualToString:@"場所"]){
        CellIdentifier = [self.placeItems objectAtIndex:indexPath.row];
        if (!cell)
        {
            cell = [[JanreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *containerView = [[UIView alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,0,100,40)];
    label.text = [_keyItems objectAtIndex:section];
    [containerView addSubview:label];
    CGRect r = [[UIScreen mainScreen] bounds];
    CGFloat w = r.size.width;
    CGFloat h = r.size.height;
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(w - 100, 0, 100, 40);
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    
    [containerView addSubview:button1];
    return containerView;
}

/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
 UITableViewCell *cell;
 cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 UIImage *img = [UIImage imageNamed:@"checkbox-checked.png"];
 cell.imageView.image = img;
 }
 */

-(NSInteger)collectionView:(JanreIndexedCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *collectionViewArray1 = self.collectionViewArray[collectionView.index];
    return collectionViewArray1.count;
}


-(UICollectionViewCell *)collectionView:(JanreIndexedCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    UILabel	*label;
	CGRect frame = CGRectMake(0, 0, 80, 80);
	label = [[UILabel alloc] initWithFrame:frame];
	label.font = [UIFont boldSystemFontOfSize:17.0];
    NSArray *collectionViewArray = self.collectionViewArray[collectionView.index];
    label.text = collectionViewArray[indexPath.item];
	[cell.contentView addSubview:label];
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[JanreIndexedCollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    JanreIndexedCollectionView *collectionView = (JanreIndexedCollectionView *)scrollView;
    NSInteger index = collectionView.index;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}
@end
