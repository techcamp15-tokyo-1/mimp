//
//  MapViewController.h
//  Mimp
//
//  Created by Sota Yamashita on 8/25/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import <UIKit/UIKit.h>
// Mapを表示するためのフレームワーク
#import <MapKit/MapKit.h>
// Mapの詳細を設定するためのフレームワーク
#import <CoreLocation/CoreLocation.h>
// FlatUIKit設定方法
#import "FlatUIKit.h"


@interface MapViewController : UIViewController <MKMapViewDelegate> {
	MKMapView *_mapView;
}



@end






