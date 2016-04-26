//
//  SubCategory.m
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "SubCategory.h"
#import "JSONParser.h"
#import "CellSubcat.h"
#import "Detail.h"

@interface SubCategory ()
{

    NSMutableArray *array;
    NSMutableArray *array1;

}

@end

@implementation SubCategory

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)backBar
{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(3, 5, 50, 30);
    [btn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backBar) forControlEvents:UIControlEventTouchUpInside];
  //  [self.navigationController.navigationBar  addSubview:btn];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


    array = [[NSMutableArray alloc]init];
    array1 = [[NSMutableArray alloc]init];
    
    
    NSString *str = [[NSString stringWithFormat:@"http://care4nature.org/food/json_artical1.php?pid=%@",[self.category  valueForKey:@"cat_id"]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str]];
    [self.indicator startAnimating];
    
    JSONParser *parsor = [[JSONParser alloc]initWithRequestForThread:req sel:@selector(parsr:) andHandler:self];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)parsr:(NSDictionary*)dic
{
    
    [self.indicator stopAnimating];
    NSLog(@"%@",[dic valueForKey:@"article"] );
    [array removeAllObjects];
    [array addObjectsFromArray:[dic valueForKey:@"article"]];
    [self.tableView reloadData];
    [array1 addObjectsFromArray:array];

    
}

-(void)viewWillAppear:(BOOL)animated
{
   // [ (NavVC*)self.navigationController  lblb].text =    [self.category  valueForKey:@"cat_name"];
   self.title =    [self.category  valueForKey:@"cat_name"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return array.count;
}


-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{


}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
   

    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(food_title CONTAINS[cd] %@)",self.serchBarr.text];
    NSMutableArray *filteredContacts = (NSMutableArray*) [array filteredArrayUsingPredicate:filter];
    
        array   = [NSMutableArray arrayWithArray: filteredContacts];
        [self.tableView reloadData];
        
    
        
    
    NSLog(@"%@",self.serchBarr.text);


}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{

    array   = [NSMutableArray arrayWithArray: array1];
    [self.tableView reloadData];
         [searchBar resignFirstResponder];
    

}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{


    
          [searchBar resignFirstResponder];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CellSubcat *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.title.text = [[array objectAtIndex:indexPath.row] valueForKey:@"food_title"];
    cell.detailTitle.text = [[array objectAtIndex:indexPath.row] valueForKey:@"food_state"];
    // Configure the cell...
    

    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    Detail* de=segue.destinationViewController;
   de.dicDetail =[array objectAtIndex:indexPath.row];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
