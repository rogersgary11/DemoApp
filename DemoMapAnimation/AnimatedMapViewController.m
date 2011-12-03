//
//  AnimatedMapViewController.m
//  DemoMapAnimation
//
//  Created by        Gaurav Sinha on 21/11/11.
//  Copyright (c) 2011  All rights reserved.
//

#import "AnimatedMapViewController.h"

@implementation AnimatedMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)Refresh
{
    for(int i=0;i<[arrayImages count];i++)
    {
        UIImageView *imageAni = (UIImageView *)[arrayImages objectAtIndex:i];
        [imageAni startAnimating];
    }
    //[customMap reloadInputViews];
    //[customMap customizeMap:arrayLatLong];

}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(Refresh) 
                                                 name:@"applicationDidBecomeActive" 
                                               object:nil];
    
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Play" style:UIBarButtonItemStyleBordered target:self action:@selector(clickToPlay:)];
    customMap = [[CustomMapView alloc] initWithFrame:self.view.bounds];
    customMap.client = self;	
    customMap.mapType = MKMapTypeStandard;
    
    customMap.showsUserLocation = YES;
    [viewMap insertSubview:customMap atIndex:1];
    NSArray *arrayLat = [NSArray arrayWithObjects:@"31.7746972",@"31.7746767",@"31.7946512",@"31.7446372", nil]; 
    NSArray *arrayLong = [NSArray arrayWithObjects:@"34.6252913",@"34.6240903",@"34.6220820",@"34.6140123", nil]; 
    
    arrayLatLong = [[NSMutableArray alloc] init];
    for(int i=0;i<[arrayLong count];i++)
    {
        NSMutableDictionary *dict = [[NSMutableDictionary    alloc  ] init];
        [dict setObject:[arrayLat objectAtIndex:i] forKey:@"Lat"];
        [dict setObject:[arrayLong objectAtIndex:i ] forKey:@"Long" ];
        [dict setObject:@"ABC" forKey:@"title"];
        [arrayLatLong addObject:dict];
    }
    
    [customMap customizeMap:arrayLatLong];
    
    //Code for audio play
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ALLALONGTHEWATCHTOWER" ofType:@"mp3"];
    NSURL* url = [NSURL fileURLWithPath:path];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
//    if(customMap!=nil)
//    {
//        NSLog(@"jdznv");
//    
//        [customMap customizeMap:arrayLatLong];
//    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)click:(id)sender
{

}

#pragma marks - User defined functions
-(IBAction)clickToPlay:(id)sender
{
    if(isPlay==0)
    {
        isPlay=1;
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Pause" style:UIBarButtonItemStyleBordered target:self action:@selector(clickToPlay:)];
        
        [audioPlayer play];
        [audioPlayer setDelegate:self];
        [self createAudioSession];
        
    }
    else
    {
        isPlay=0;
        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Play" style:UIBarButtonItemStyleBordered target:self action:@selector(clickToPlay:)];
        [audioPlayer pause];
    }
}


-(void)createAudioSession {
    	
	// Registers this class as the delegate of the audio session.
	[[AVAudioSession sharedInstance] setDelegate: self];
	
	// Use this code instead to allow the app sound to continue to play when the screen is locked.
    //for ipod
	
    //[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
    //  for iphone
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    
	
	NSError *myErr;
	
	AVAudioSession *audioSession = [AVAudioSession sharedInstance];
	[audioSession setCategory:AVAudioSessionCategoryPlayback error:&myErr];
	
    
    
}

@end
