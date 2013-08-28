//
//  XMLParser.h
//  Mimp
//
//  Created by Sota Yamashita on 8/29/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSXMLParser <NSXMLParserDelegate>{
    
    NSMutableArray *xmlElements;//受信した情報が配列で入る
}

@property (nonatomic, retain) NSMutableArray *xmlElements;

- (NSArray *) parse:(NSData *) xmlData;

@end
