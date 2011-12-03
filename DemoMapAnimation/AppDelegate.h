//
//  AppDelegate.h
//  DemoMapAnimation
//
//  Created by        Gaurav Sinha on 21/11/11.
//  Copyright (c) 2011    All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimatedMapViewController.h"
#import "Constant.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locmanager;
    UIBackgroundTaskIdentifier bgTask; 

    UINavigationController *navigation;
}
@property (strong, nonatomic) UIWindow *window;
//NSString* machineName();
-(void)targetMethod;

@end
