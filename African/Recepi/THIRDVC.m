//
//  THIRDVC.m
//  Recepi
//
//  Created by PRAKRUTI on 16/02/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "THIRDVC.h"
#import "JSONParser.h"

@interface THIRDVC ()

@end

@implementation THIRDVC

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
    NSString *str2 = [NSString stringWithFormat:@"<html> <body bgcolor=\"#F3EEE3\"> Loading...</body></html>"  ];
        [self.webing loadHTMLString:str2 baseURL:nil];

    
//    [ (NavVC*)self.navigationController  lblb].text = @"ABOUT";
    self.title = @"ABOUT";

    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"about_select.png"] tag:2];
    [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"about_select.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"about.png"]];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0);
    
    [self.indicator startAnimating];

    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://thecompleteafricanrecipe.com/about.php"]];
    
    JSONParser *parsor = [[JSONParser alloc]initWithRequestForThread:req sel:@selector(parsr:) andHandler:self];
    

	// Do any additional setup after loading the view.
    
        // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{

      
}

-(void)parsr:(NSDictionary*)dic
{
    
    [self.indicator stopAnimating];
    
    NSLog(@"%@",[dic valueForKey:@"a_desc"]);
    
    self.imageV.imageURL = [NSURL URLWithString:[[[dic valueForKey:@"a_image_url"] objectAtIndex:0] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
   
    NSString *str2 = [NSString stringWithFormat:@"<html> <body bgcolor=\"#F3EEE3\">%@</body></html>",[[dic valueForKey:@"a_desc"] objectAtIndex:0]  ];

    
    
    [self.webing loadHTMLString:str2 baseURL:nil];
    
//    [array removeAllObjects];
//    [array addObjectsFromArray:(NSArray*)dic];
//    [self.collectionView reloadData];
    
    
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
