//
//  MainScreenViewController.m
//  CountdownApp
//
//  Created by Joe Cortopassi on 1/19/13.
//  Copyright (c) 2013 Joe Cortopassi. All rights reserved.
//

#import "MainScreenViewController.h"
#import "SettingsView.h"
#import "SlidingView.h"

@interface MainScreenViewController ()

@property (nonatomic, strong) SettingsView *settingsView;
@property (nonatomic, strong) SlidingView *slidingView;
@property (nonatomic, assign) CGRect bounds;

@end





@implementation MainScreenViewController

@synthesize settingsView;
@synthesize bounds;


/**********************
    Inherited Methods
 **********************/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.bounds = [[UIScreen mainScreen] bounds];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupSettingsView];
    [self setupSlidingView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/**********************
       View Setup
 **********************/


- (void) setupSettingsView
{   
    self.settingsView = [[SettingsView alloc] init];
    
    
    [self.view addSubview:self.settingsView];
}


- (void) setupSlidingView
{
    self.slidingView = [[SlidingView alloc] init];
    
    
    [self.view addSubview:self.slidingView];
}





@end
