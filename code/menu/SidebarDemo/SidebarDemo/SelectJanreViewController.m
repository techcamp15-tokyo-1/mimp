//
//  SelectJanreViewController.m
//  SidebarDemo
//
//  Created by fixedpoint on 8/26/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SelectJanreViewController.h"

@interface SelectJanreViewController ()
@property (nonatomic, strong) NSArray *janreItems;
@property (nonatomic, strong) NSArray *pictureItems;
@end

@implementation SelectJanreViewController

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
	// Do any additional setup after loading the view.
    _janreItems = @[@"Action", @"Alternative", @"Animation",  @"Blues", @"Books", @"Business", @"Childrens", @"Christian", @"Classic", @"Comedy", @"Country", @"Dance", @"Documentary", @"Drama", @"Education", @"Electronic", @"Engineering", @"Finearts", @"Folk", @"Health", @"Hiphop", @"History", @"Holiday", @"Horror", @"Humanities", @"Independent", @"Jazz", @"Jpop", @"Kayokyoku", @"Kids", @"Language", @"Latin", @"Literature", @"Mathematics", @"Music", @"Newage", @"Nonfiction", @"Pop", @"R & B", @"Reality", @"Reggae", @"Rock", @"Romance", @"Science", @"Scifi", @"Shortfilms", @"Socialscience", @"Soundtrack", @"Spoken", @"Sports", @"Teens", @"Thriller", @"Vocal", @"Western", @"World"];
    
    _pictureItems = @[@"genre-action", @"genre-alternative", @"genre-animation", @"genre-blues", @"genre-books", @"genre-business", @"genre-childrens", @"genre-christian", @"genre-classic", @"genre-comedy", @"genre-country", @"genre-dance", @"genre-documentary", @"genre-drama", @"genre-education", @"genre-electronic", @"genre-engineering", @"genre-finearts", @"genre-folk", @"genre-health", @"genre-hiphop", @"genre-history", @"genre-holiday", @"genre-horror", @"genre-humanities", @"genre-independent", @"genre-jazz", @"genre-jpop", @"genre-kayokyoku", @"genre-kids", @"genre-language", @"genre-latin", @"genre-literature", @"genre-mathematics", @"genre-music", @"genre-newage", @"genre-nonfiction", @"genre-pop", @"genre-rb", @"genre-reality", @"genre-reggae", @"genre-rock", @"genre-romance", @"genre-science", @"genre-scifi", @"genre-shortfilms", @"genre-socialScience", @"genre-soundtrack", @"genre-spoken", @"genre-sports", @"genre-teens", @"genre-thriller", @"genre-vocal", @"genre-western", @"genre-world"];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_janreItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier;
    UITableViewCell *cell;
    
    NSString *janre = [self.janreItems objectAtIndex:indexPath.row];
    NSString *picture = [NSString stringWithFormat:@"%@%@", [self.pictureItems objectAtIndex:indexPath.row], @".jpg"];
    CellIdentifier = janre;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        CGRect r = [[UIScreen mainScreen] bounds];
        CGFloat w = r.size.width;
        CGFloat h = r.size.height;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:picture]];
        imageView.frame = CGRectMake(5, 5, 30, 30);
        imageView.tag = 0;
        [cell addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45, 5, 100, 30)];
        label.text = janre;
        label.tag = 1;
        [cell addSubview:label];
         cell.tag = 1;
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
    CGRect r = [[UIScreen mainScreen] bounds];
    CGFloat w = r.size.width;
    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, w, 40)];
    tv.text = @"好きなジャンルを選択してください";
    [containerView addSubview:tv];
    return containerView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.janreItems objectAtIndex:indexPath.row];
    UITableViewCell *cell;
    cell = [tableView cellForRowAtIndexPath:indexPath];
    //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell.tag == 1) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checked.jpg"]];
        CGRect r = [[UIScreen mainScreen] bounds];
        CGFloat w = r.size.width;
        imageView.frame = CGRectMake(w - 35, 10, 20, 20);
        imageView.tag = 2;
        [cell addSubview:imageView];
        cell.tag = 0;
    } else {
        for (UIView *view in [cell subviews]) {
            if(view.tag == 2) {
                [view removeFromSuperview];
            }
        }
        cell.tag = 1;
    }
}

- (IBAction)move:(id)sender
{
    [self performSegueWithIdentifier:@"segue3" sender:self];
}


@end
