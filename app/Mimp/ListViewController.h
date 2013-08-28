//
//  ListViewController.h
//  Mimp
//
//  Created by Sota Yamashita on 8/29/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import <UIKit/UIKit.h>

// XMLパーサー
@class XMLParser;

@interface ListViewController : UITableViewController
{
     XMLParser *xmlParser;
}

// インスタンス変数をプロパティとして宣言
@property (nonatomic, retain) XMLParser *xmlParser;


@end
