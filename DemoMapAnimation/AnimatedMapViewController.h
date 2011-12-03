//
//  AnimatedMapViewController.h
//  DemoMapAnimation
//
//  Created by        Gaurav Sinha on 21/11/11.
//  Copyright (c) 2011    All rights reserved.
//251320

/*
 */
#import "Constant.h"
#import <UIKit/UIKit.h>
#import "CustomMapView.h"
#import <AVFoundation/AVFoundation.h>
@interface AnimatedMapViewController : UIViewController<customMapvViewDelegate,AVAudioPlayerDelegate>
{
    CustomMapView   *customMap;
    NSMutableArray *arrayLatLong;
    IBOutlet UITextField *fieldUrl;
    IBOutlet UIView *viewMap;
    int isPlay;
    AVAudioPlayer *audioPlayer;
}
-(IBAction)click:(id)sender;
-(void)createAudioSession;
-(IBAction)clickToPlay:(id)sender;
@end
