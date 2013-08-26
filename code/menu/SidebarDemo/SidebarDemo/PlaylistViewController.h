//
//  PlaylistViewController.h
//  SidebarDemo
//
//  Created by fixedpoint on 8/23/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PlaylistViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
- (IBAction)move:(id)sender;
@end
