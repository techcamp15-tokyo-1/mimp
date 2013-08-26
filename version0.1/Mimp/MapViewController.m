//
//  MapViewController.m
//  Mimp
//
//  Created by Sota Yamashita on 8/25/13.
//  Copyright (c) 2013 Sota Yamashita. All rights reserved.
//

#import "MapViewController.h"
#import "CustomAnnotation.h"
#import "PlayViewController.h"


@interface MapViewController ()
@property (nonatomic, strong) IBOutlet PlayViewController *playViewController;

@end

@implementation MapViewController {
    IBOutlet MKMapView* __weak map_; // connect IBOutlet and delegate in Interface Builder
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    _mapView.delegate = self;
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ナビゲーションバー色変更
    // アプリケーション全体的にバーボタンアイテムをカスタマイズ(Appearanceの設定)
    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
                                  highlightedColor:[UIColor belizeHoleColor]
                                      cornerRadius:3];
    // UINavigationBarのUIをフラット化
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    //　ステータスバ設定
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
    
    


    // 地図の表示
    _mapView = [[MKMapView alloc] init];
    _mapView.frame = self.view.bounds;
    _mapView.mapType = MKMapTypeStandard;
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    [_mapView.userLocation addObserver:self
                            forKeyPath:@"location"
                               options:0
                               context:NULL];

    // 
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.685623,139.763153)
                                                    title:@"Action Playlist"
                                                 subtitle:@"Action"]];
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.690747,139.756866)
                                                    title:@"ROCK'N ROLL"
                                                 subtitle:@"Rock"]];
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.681666,139.764869)
                                                    title:@"Mr. Bean"
                                                 subtitle:@"Comedy"]];
    

    
    
}




// アノテーション
- (MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    MKAnnotationView *annotationView;
    NSString* identifier = @"Pin";
    annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(nil == annotationView) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    annotationView.image = [UIImage imageNamed:@"map.png"];
    annotationView.canShowCallout = YES;
    // 変数宣言
    UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    // ボタン設置
    annotationView.rightCalloutAccessoryView = disclosureButton;
    // ボタンアクション指定
    [disclosureButton addTarget:self action:@selector(playPlaylist) forControlEvents:UIControlEventTouchUpInside];
    
    annotationView.annotation = annotation;
    return annotationView;
    
}

// 画面遷移
-(void)playPlaylist{
    [self performSegueWithIdentifier:@"presentDetailView" sender:self];
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    // 地図の中心座標に現在地を設定
    _mapView.centerCoordinate = _mapView.userLocation.location.coordinate;
    
    // 表示倍率の設定
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(_mapView.userLocation.coordinate, span);
    [_mapView setRegion:region animated:YES];
    
    
    // 一度しか更新しない場合はremoveする必要、これを設定すると中心を変えられる
    [_mapView.userLocation removeObserver:self forKeyPath:@"location"];
}







/**
 * ナビゲーションバー表示
 *
 * @param : NO => ナビゲーションバーが消える
 * @param : YES => ナビゲーションのアニメーションが使える
 */
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
// ナビゲーションバー非表示
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end




