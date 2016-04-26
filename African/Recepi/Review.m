//
//  Review.m
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "Review.h"
#import "ReviewCell.h"
#import "JSONParser.h"

@interface Review ()
{

    NSMutableArray *array;
}
@end

@implementation Review

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"REVIEW";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    array = [[NSMutableArray alloc]init];
    
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://care4nature.org/food/viewreview.php"]];
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
    [self.tableView reloadData];
    
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.name.text = [[array objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.comment.text= [[array objectAtIndex:indexPath.row] valueForKey:@"comment"];
    cell.title.text= [[array objectAtIndex:indexPath.row] valueForKey:@"food_title"];
    
    
    switch ([[[array objectAtIndex:indexPath.row] valueForKey:@"rating"] integerValue]) {
        case 0:
            cell.btn1.selected =FALSE;
            cell.btn2.selected =FALSE;
            cell.btn3.selected =FALSE;
            cell.btn4.selected =FALSE;
            cell.btn5.selected =FALSE;

            break;
        case 1:
            cell.btn1.selected =TRUE;
            cell.btn2.selected =FALSE;
            cell.btn3.selected =FALSE;
            cell.btn4.selected =FALSE;
            cell.btn5.selected =FALSE;
            break;
        case 2:
            cell.btn1.selected =TRUE;
            cell.btn2.selected =TRUE;
            cell.btn3.selected =FALSE;
            cell.btn4.selected =FALSE;
            cell.btn5.selected =FALSE;
            
            break;
        case 3:
            cell.btn1.selected =TRUE;
            cell.btn2.selected =TRUE;
            cell.btn3.selected =TRUE;
            cell.btn4.selected =FALSE;
            cell.btn5.selected =FALSE;
            
            break;
        case 4:
            cell.btn1.selected =TRUE;
            cell.btn2.selected =TRUE;
            cell.btn3.selected =TRUE;
            cell.btn4.selected =TRUE;
            cell.btn5.selected =FALSE;
            
            break;
        case 5:
            cell.btn1.selected =TRUE;
            cell.btn2.selected =TRUE;
            cell.btn3.selected =TRUE;
            cell.btn4.selected =TRUE;
            cell.btn5.selected =TRUE;
            break;
            
        default:
            break;
    }
    

    
    // Configure the cell...
    
    return cell;
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
