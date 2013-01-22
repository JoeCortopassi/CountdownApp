//
//  SettingsView.m
//  CountdownApp
//
//  Created by Joe Cortopassi on 1/21/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "SettingsView.h"

@interface SettingsView ()

@property (nonatomic, assign) CGRect bounds;

@end


@implementation SettingsView

@synthesize bounds;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bounds = [[UIScreen mainScreen] bounds];
        self.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);

        
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
