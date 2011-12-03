//
//  iCodeBlogAnnotationView.m
//  Find a Park
//
//  Created by Gaurav Sinha on 25/02/10.

//

#import "iCodeBlogAnnotationView.h"

#define kHeight 50//43 //36
#define kWidth  50//22 //30
#define kBorder 2

@implementation iCodeBlogAnnotationView
@synthesize annotation_view_tag;


- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    MyAnnotation* myAnnotation = (MyAnnotation*)annotation;
    
    annotation_view_tag = myAnnotation.ann_tag;	
    
    NSArray *arrayImageAn = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"4.png"],[UIImage imageNamed:@"5.png"],[UIImage imageNamed:@"6.png"],[UIImage imageNamed:@"7.png"],nil];

    self = [super initWithAnnotation:myAnnotation reuseIdentifier:reuseIdentifier];
    
    self.frame = CGRectMake(0, 0, kWidth,kHeight);
    self.backgroundColor = [UIColor clearColor];
    
    UIImageView  *flower  =  [[UIImageView alloc ]init];
    flower.frame    = CGRectMake(0,0, kWidth,kHeight);
    flower.image = [UIImage imageNamed:@"7.png"];
    flower.animationImages = [NSArray arrayWithArray:arrayImageAn]; 
    //add more images as necessary
    
    flower.animationDuration = 1.00;
    flower.animationRepeatCount = 1;
    [flower startAnimating];
    
    [arrayImages addObject:flower];
    
    [self addSubview:flower];

    return self;
}


@end
