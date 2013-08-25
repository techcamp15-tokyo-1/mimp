//
//  MapViewAnnotation.m
//  Mimp
//
//  Created by Sota Yamashita on 8/25/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize coordinate=_coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	_coordinate=c;
	return self;
}

@end
