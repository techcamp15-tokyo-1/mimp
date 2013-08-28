//
//  XMLParser.m
//  Mimp
//
//  Created by Sota Yamashita on 8/29/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize xmlElements;

//Document開始
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    //配列を初期化
    self.xmlElements=[[NSMutableArray alloc]init];
    
}

//開始エレメント
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    //エレメント開始
    if(qName){
        elementName=qName;
    }
    
    //情報をxmlElementsに格納
    if([elementName isEqualToString:@"figure"] || [elementName isEqualToString:@"ranking"]){
        NSArray *tempArray=[[NSArray alloc]initWithObjects:
                            [attributeDict objectForKey:@"id"],
                            [attributeDict objectForKey:@"name"],
                            nil];
        [xmlElements addObject:tempArray];
    }
    
    if([elementName isEqualToString:@"answer"]){
        NSArray *tempArray=[[NSArray alloc]initWithObjects:
                            [attributeDict objectForKey:@"id"],
                            [attributeDict objectForKey:@"column1"],
                            [attributeDict objectForKey:@"column2"],
                            [attributeDict objectForKey:@"column3"],
                            [attributeDict objectForKey:@"writer"],
                            nil];
        [xmlElements addObject:tempArray];
    }
}

//終了エレメント
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
}

//要素中の文字列発見
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
}


- (NSArray *)parse:(NSData *)xmlData{
    
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:xmlData];
    [parser setDelegate:self];
    [parser parse];
    
    return self.xmlElements;
    
}

@end
