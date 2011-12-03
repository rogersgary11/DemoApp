//
//  AppDelegate.m
//  DemoMapAnimation
//
//  Created by        Gaurav Sinha on 21/11/11.
//  Copyright (c) 2011    All rights reserved.
//
#import <sys/utsname.h>

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

//NSString* machineName()
//{
//    struct utsname systemInfo;
//    uname(&systemInfo);
//    
//    return [NSString stringWithCString:systemInfo.machine
//                              encoding:NSUTF8StringEncoding];
//}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    arrayImages = [[NSMutableArray alloc] init];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    AnimatedMapViewController *animatedController = [[AnimatedMapViewController alloc] init];
    navigation = [[UINavigationController alloc] initWithRootViewController:animatedController];
    [self.window addSubview:navigation.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{    
    UIApplication *app = [UIApplication sharedApplication];
    
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        
        ////NSLog(@"APPdid enter in background");
        [app endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;        
    }];
    
    
    
    // Start the long-running task and return immediately.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        
        while (bgTask) 
        {
            sleep(20);
            [self targetMethod];
            // This is where you can do your "X minutes" in seconds (here 10)
            // sleep(300);
        }
        
    });
    
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}


-(void)targetMethod
{
    ////NSLog(@"timer in background");
    locmanager = [[CLLocationManager alloc] init];
    [locmanager setDelegate:self];
    //kCLLocationAccuracyBestForNavigation
    [locmanager setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
    [locmanager startUpdatingLocation];
    
    //controller = [[UserLocationController alloc] init];
    //[controller findUserLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [locmanager stopUpdatingLocation];
    locmanager.delegate = nil;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSMutableURLRequest *request = [NSMutableURLRequest 
                                    requestWithURL:[NSURL URLWithString:@"sparktlv.com"] 
                                    cachePolicy:NSURLRequestUseProtocolCachePolicy
                                    timeoutInterval:100];  
    
    // receivedData = [[NSMutableData alloc] init];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:request
                                   delegate:self
                                   startImmediately:YES];    
    [connection release];
    //}
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"applicationDidBecomeActive" object:nil];
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
