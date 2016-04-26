//
//  NavVC.m
//  Recepi
//
//  Created by PRAKRUTI on 16/02/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "NavVC.h"

@interface NavVC ()

@end

@implementation NavVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
  
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    


}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    UIImageView *vi = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    vi. image= [UIImage imageNamed:@"header.png"];
   
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"H.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    self.navigationBar.tintColor = [UIColor  colorWithRed:208.0/255.0 green:95.0/255.0 blue:43.0/255.0 alpha:1];
    self.lblb= [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 30)];
//    self.lblb.text  =@"CONTACT";
    self.lblb.font = [UIFont boldSystemFontOfSize:20];
    self.lblb.backgroundColor = [UIColor clearColor];
    self.lblb.textColor = [UIColor whiteColor];
    self.lblb.textAlignment = NSTextAlignmentCenter;
    [self.navigationBar addSubview:self.lblb];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
