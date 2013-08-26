//
//  CustomAnnotation.m
//  Mimp
//
//  Created by Sota Yamashita on 8/26/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation
@synthesize coordinate;
@synthesize annotationTitle;
@synthesize annotationSubtitle;



- (NSString *)title {
    return annotationTitle;
}

- (NSString *)subtitle {
    return annotationSubtitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationSubtitle {
    coordinate = _coordinate;
    self.annotationTitle = _annotationTitle;
    self.annotationSubtitle = _annotationSubtitle;
    return self;
}



//- (void) dealloc {
//    [annotationTitle release];
//    [annotationSubtitle release];
//    [super dealloc];
//}

@end
