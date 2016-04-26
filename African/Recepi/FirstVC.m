//
//  FirstVC.m
//  Recepi
//
//  Created by Maulik on 2/16/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "FirstVC.h"
#import "JSONParser.h"
#import "MainCell.h"
#import "SubCategory.h"

@interface FirstVC ()
{

    NSMutableArray *array ;
    
}

@end

@implementation FirstVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{

  //  [ (NavVC*)self.navigationController  lblb].text = @"MAIN MENU";


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [[NSMutableArray alloc]init];
   // [ (NavVC*)self.navigationController  lblb].text = @"MAIN MENU";
    
    self.title =@"MAIN MENU";
    
    

    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"home_select.png"] tag:0];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0);

    [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"home_select.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home.png"]];
    
      

    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://care4nature.org/food/test.php"]];
    [self.indicator startAnimating];
    
    JSONParser *parsor = [[JSONParser alloc]initWithRequestForThread:req sel:@selector(parsr:) andHandler:self];

    // Do any additional setup after loading the view from its nib.
}
-(void)parsr:(NSDictionary*)dic
{
    
    [self.indicator stopAnimating];

    NSLog(@"%@",dic );
    [array removeAllObjects];
   [array addObjectsFromArray:(NSArray*)dic];
    [self.collectionView reloadData];


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
  
    
    return array.count;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.Lbl.text = [[array objectAtIndex:indexPath.item]valueForKey:@"cat_name"];
    cell.mainImage.imageURL = [NSURL URLWithString:[[[array objectAtIndex:indexPath.item]valueForKey:@"cat_image"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
    NSIndexPath *indexPath =   [self.collectionView indexPathForCell:sender];
    SubCategory *sub =  segue.destinationViewController;
   sub.category  = [array objectAtIndex:indexPath.item];

}

@end
