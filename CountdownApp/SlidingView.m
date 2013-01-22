//
//  SlidingView.m
//  CountdownApp
//
//  Created by Joe Cortopassi on 1/22/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "SlidingView.h"
#import "MenuBarView.h"

@interface SlidingView ()

@property (nonatomic, assign) CGRect normalBounds;
@property (nonatomic, assign) CGRect slideOutBounds;
@property (nonatomic, strong) MenuBarView *menuBarView;

@end


@implementation SlidingView

@synthesize normalBounds, slideOutBounds;
@synthesize menuBarView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.normalBounds = [[UIScreen mainScreen] bounds];
        self.slideOutBounds = CGRectMake((self.normalBounds.size.width - 70.0), 0, self.normalBounds.size.width, self.normalBounds.size.height);
        self.frame = self.normalBounds;        
        
        
        
        
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



-(void) toggleSettings
{
    if (CGRectEqualToRect(self.frame, self.slideOutBounds))
    {
        [self animateSliderToPosition:kSliderClose];
    }
    else
    {
        [self animateSliderToPosition:kSliderOpen];
    }
}


- (void) animateSliderToPosition:(SliderPosition)position
{
    CGFloat duration;
    CGRect targetFrame;
    
    if (position == kSliderClose)
    {
        targetFrame = self.normalBounds;
        duration = (self.frame.origin.x / self.slideOutBounds.origin.x);
    }
    else
    {
        targetFrame = self.slideOutBounds;
        duration = 1 - ( ((self.frame.origin.x)? self.frame.origin.x: 1.0) / self.slideOutBounds.origin.x);
    }
    
    
    duration *= 0.5;
    
    
    [UIView animateWithDuration:duration animations:^(void){
        self.frame = targetFrame;
    }];
}


/**********************
    Touch Events
 **********************/

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self];
    CGPoint previousLocation = [aTouch previousLocationInView:self];
    CGFloat newXPosition = location.x-previousLocation.x;
    
    if ((self.frame.origin.x + newXPosition) <= 0.0)
    {
        self.frame = self.normalBounds;
    }
    else if ((self.frame.origin.x + newXPosition) >= self.slideOutBounds.origin.x)
    {
        self.frame = self.slideOutBounds;
    }
    else
    {
        self.frame = CGRectOffset(self.frame, newXPosition, 0);
    }
}


- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{   
    if ((self.frame.origin.x) <= 0.0)
    {
        self.frame = self.normalBounds;
    }
    else if (self.frame.origin.x >= self.slideOutBounds.origin.x)
    {
        self.frame = self.slideOutBounds;
    }
    else if (self.frame.origin.x <= self.bounds.size.width/2)
    {
        [self animateSliderToPosition:kSliderClose];
    }
    else if (self.frame.origin.x > self.bounds.size.width/2)
    {
        [self animateSliderToPosition:kSliderOpen];
    }
    else
    {
        // do nothing;
    }
}






@end
