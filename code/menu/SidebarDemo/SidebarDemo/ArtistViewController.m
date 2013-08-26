//
//  ArtistViewController.m
//  SidebarDemo
//
//  Created by fixedpoint on 8/23/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ArtistViewController.h"

@interface ArtistViewController ()

@end

@implementation ArtistViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)move:(id)sender
{
    [self performSegueWithIdentifier:@"segue4" sender:self];
}
@end
