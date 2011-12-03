//
//  MyAnnotation.m
//  swiftGO
//
//  Created by Gaurav Sinha on 23/01/10.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate,ann_tag,title,subtitle,annotations;

-init
{
	return self;
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)inCoord
{
	coordinate = inCoord;
	return self;
}

-(void)dealloc 
{
//	[title release];
//	[subtitle release];
//	[userData release];
//	
	//[super dealloc];
}

@end
