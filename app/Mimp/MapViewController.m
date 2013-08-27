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
    
    /**
      * プレイリスト用デモ
      * 場所 : 渋谷周辺
      *
      */
    // 東京都渋谷区道玄坂一丁目12番1号渋谷マークシティウエスト
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.657988,139.698284)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    // 東京都渋谷区道玄坂2丁目11番1号 サイバーエージェントビル
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.657989,139.696129)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    // 東京都渋谷区円山町19番1号 渋谷プライムプラザ
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.656563,139.695006)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    // 東京都渋谷区神泉町8-16渋谷ファーストプレイス
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.655262,139.69373)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    /**
     * プロモーション用デモ
     * 場所 : 渋谷周辺 レコード会社
     *
     */
    // タワーレコード渋谷店
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.661944,139.701079)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    
    /**
     * 店舗用デモ
     * 場所 : 渋谷周辺 店舗 スターバックス 109 etc
     *
     */
    // Starbucks 渋谷マークシティ店
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.658294,139.699005)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    // Starbucks SHIBUYA TSUTAYA店
    [_mapView addAnnotation:
    [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.65993,139.700318)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    // 109
    [_mapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.659588,139.698629)
                                                   title:@"Mr. Bean"
                                                subtitle:@"Comedy"]];
    
    
}




// アノテーション追加
- (MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKAnnotationView *annotationView;
    NSString* identifier = @"Pin";
    // アノテーションを追加するかどうか判定
    if ([annotation isKindOfClass:[MKUserLocation class]]){ //ユーザーの現在地の場合
        return nil;
    } else { //ユーザーの現在地ではない場合
    
        annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if(nil == annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        annotationView.canShowCallout = YES;
        // アルバムアートワーク画像表示
        UIImage *playlistImage = [UIImage imageNamed:@"map.png"];
        annotationView.image = playlistImage;
        /*
         *
         * Annotationの右へのボタン画像にする
         *
         UIImageView *imageView = // init the image view ...
         [imageView setImage:_image];
         [annotationView setRightCalloutAccessoryView:imageView];
         */
        // 変数宣言
        UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        // 再生画面へのボタン設置
        annotationView.rightCalloutAccessoryView = disclosureButton;
        // 再生画面へのアクション指定
        [disclosureButton addTarget:self action:@selector(playPlaylist) forControlEvents:UIControlEventTouchUpInside];

        // アルバムアートワークリサイズ
        // リサイズ前UIImage
        UIImage *img_before = [UIImage imageNamed:@"preview.png"];
        // リサイズ後UIImage
        UIImage *img_after;
        // リサイズ後幅サイズ
        CGFloat width = 30;
        // リサイズ後高さサイズ
        CGFloat height = 30;
        
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        [img_before drawInRect:CGRectMake(0, 0, width, height)];
        img_after = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    
        // アルバムアートワークを表示
        UIImage *albumArtworkView = [[UIImageView alloc] initWithImage:img_after];
        annotationView.leftCalloutAccessoryView = albumArtworkView;
        annotationView.annotation = annotation;
        
        return annotationView;
    }
}

// 画面遷移
-(void)playPlaylist{
    [self performSegueWithIdentifier:@"presentDetailView" sender:self];
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    // 地図の中心座標に現在地設定
    _mapView.centerCoordinate = _mapView.userLocation.location.coordinate;
    
    // 表示倍率設定
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(_mapView.userLocation.coordinate, span);
    [_mapView setRegion:region animated:YES];
    
    
    // 一度しか更新しない場合はremoveする必要、これを設定すると中心地変更可
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




