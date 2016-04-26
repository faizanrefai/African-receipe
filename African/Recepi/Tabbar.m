//
//  Tabbar.m
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "Tabbar.h"

@interface Tabbar ()

@end

@implementation Tabbar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"footer.png"]];
    
  //  self.tabBar.tintColor = [UIColor clearColor];
    
   	// Do any additional setup after loading the view.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
{
//    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil tag:2];
//    [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"about_select.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"about.png"]];
//    
//    [[self tabBarItem] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                               [UIColor whiteColor], UITextAttributeTextColor,
//                                               nil] forState:UIControlStateNormal];
//    
//    UIColor *selectedColor = [UIColor colorWithRed: (float)71/255 green: (float)156/255 blue: (float)63/255 alpha:1.0];
//    [[self tabBarItem] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                               selectedColor, UITextAttributeTextColor,
//                                               nil] forState:UIControlStateSelected];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
