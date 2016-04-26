//
//  Detail.m
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "Detail.h"
#import "DetailCeell.h"

@interface Detail ()<detailCell>
{

    float size;
}

@end

@implementation Detail

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)save:(NSInteger)i
{
    
    NSMutableArray *DICARRAY= [[NSMutableArray alloc]initWithArray:  [[NSUserDefaults standardUserDefaults]valueForKey:@"fav"]];
    
    if ([DICARRAY containsObject:self.dicDetail]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Already exsist in favorite list" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }else {
    
        [DICARRAY addObject:self.dicDetail];
        [[NSUserDefaults standardUserDefaults] setObject:DICARRAY forKey:@"fav"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Saved in favorite list" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];

}
    
   
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [self.dicDetail valueForKey:@"food_title"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 4;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 1:{
            
            
            NSString *str2 = [NSString stringWithFormat:@"<html> <body bgcolor=\"#F3EEE3\">%@</body></html>",[self.dicDetail valueForKey:@"food_desc"]];
            CGSize textSize = [str2 sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(280, 5000)];
            size = textSize.height;
            return textSize.height -50;
            
            break;
        }
            
        case 2:{
            
            
            NSString *str = [NSString stringWithFormat:@"<html> <body bgcolor=\"#F3EEE3\">%@</body></html>",[self.dicDetail valueForKey:@"direction"]];
            
            CGSize textSize = [str sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(280, 5000)];
            size = textSize.height  ;
            return textSize.height;
                        
            break;
        }
            
        case 3:{
            
            
             
            return 294 ;
            
            
            break;
        }
            
            
            
        default:{
            
            return 210;
            
            break;
        }
    } 
    
    
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *CellIdentifier = [NSString stringWithFormat:@"%d",indexPath.row+1];
    DetailCeell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.img.imageURL = [NSURL URLWithString:[[self.dicDetail valueForKey:@"food_image_url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    cell.titleName.text = [self.dicDetail valueForKey:@"food_title"];
        //cell.ingredient.text = [self.dicDetail valueForKey:@"food_desc"];
    
    NSString *str2 = [NSString stringWithFormat:@"<html> <body bgcolor=\"#F3EEE3\">%@</body></html>",[self.dicDetail valueForKey:@"food_desc"]];
  
    CGRect rec = cell.webingIntegrity.frame;
    rec.size.height = cell.frame.size.height-40 ;
    cell.webingIntegrity.frame = rec;
    [cell.webingIntegrity loadHTMLString: str2 baseURL:nil];
    
    
    NSString *str = [NSString stringWithFormat:@"<html> <body bgcolor=\"#F3EEE3\">%@</body></html>",[self.dicDetail valueForKey:@"direction"]];
    
    [cell.webDirection loadHTMLString: str baseURL:nil];
    
    
    CGRect rec1 = cell.webDirection.frame;
    rec1.size.height = cell.frame.size.height-40 ;
    cell.webDirection.frame = rec1;

    

    
//    cell.directions.text = [self.dicDetail valueForKey:@"direction"];
    cell.comments.layer.cornerRadius = 10;
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
