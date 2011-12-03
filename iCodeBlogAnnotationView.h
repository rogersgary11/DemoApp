//
//  iCodeBlogAnnotationView.h
//  Find a Park
//
//  Created by Gaurav Sinha on 25/02/10.
//  Copyright   2010. All rights reserved.
//  Email:gauravs@ 
//


/**
 @ Description : This class is used to provide the functionality to add custom annotation on map view.
  */
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "Constant.h"

@interface iCodeBlogAnnotationView : MKAnnotationView 
{
	NSInteger annotation_view_tag;
}

@property(nonatomic,assign) NSInteger annotation_view_tag;

@end
