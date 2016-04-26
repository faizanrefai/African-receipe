//
//  DetailCeell.m
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "DetailCeell.h"

@implementation DetailCeell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    self.comments.inputAccessoryView = self.toolBar;
self.rating = @"0";


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addFav:(id)sender {
    
    
    [self.del save:0];
    
    
}


- (IBAction)posting:(id)sender {
    
    
    if (!self.name.text.length) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please insert your name." message:Nil delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if (!self.comments.text.length) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please insert your comment." message:Nil delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    [self.comments resignFirstResponder];
    [self.name resignFirstResponder];
    
    NSMutableString *httpBodyString;
    NSURL *url;
    NSMutableString *urlString;
    
    httpBodyString=[[NSMutableString alloc] init];
    httpBodyString = [NSString stringWithFormat:@"name=%@&comment=%@&rating=%@",self.name.text,self.comments.text,self.rating];
   
    urlString=[[NSMutableString alloc] initWithString:@"http://care4nature.org/food/add_maseurments.php"];
    
    url=[[NSURL alloc] initWithString:urlString];
    
    NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSISOLatin1StringEncoding]];
    
    
    
     NSData *DATA =  [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:Nil error:Nil];
    NSString *str = [[NSString alloc]initWithData:DATA encoding:NSUTF8StringEncoding];
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:nil delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
  //  NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    
    
//    if (!connectionResponse)
//    {
//        NSLog(@"Failed to submit request");
//    }
//    else
//    {
        NSLog(@"--------- Request submitted ---------  %@",str);
//       // NSLog(@"connection: %@ method: %@, encoded body: %@, body: %a", connectionResponse, [urlRequest HTTPMethod], [urlRequest HTTPBody], httpBodyString);
//        //responseData=[NSMutableData data] ;
//    }
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [self.name   resignFirstResponder];
    return YES;

}


- (IBAction)vireRevirePressed:(id)sender {
    
    
}


- (IBAction)ratingPressed:(UIButton*)sender {

    switch (sender.tag) {
        case 0:
            
            break;
        case 1:
            self.rating = @"1";
            break;
        case 2:
            self.rating = @"2";

            break;
        case 3:
            self.rating = @"3";

            break;
        case 4:
            self.rating = @"4";

            break;
        case 5:
            self.rating = @"5";

            break;
            
        default:
            break;
    }
    
    
    switch (sender.tag) {
        case 0:
            
            break;
        case 1:
            self.btn1.selected =TRUE;
            self.btn2.selected =FALSE;
            self.btn3.selected =FALSE;
            self.btn4.selected =FALSE;
            self.btn5.selected =FALSE;
            break;
        case 2:
            self.btn1.selected =TRUE;
            self.btn2.selected =TRUE;
            self.btn3.selected =FALSE;
            self.btn4.selected =FALSE;
            self.btn5.selected =FALSE;
            
            break;
        case 3:
            self.btn1.selected =TRUE;
            self.btn2.selected =TRUE;
            self.btn3.selected =TRUE;
            self.btn4.selected =FALSE;
            self.btn5.selected =FALSE;
            
            break;
        case 4:
            self.btn1.selected =TRUE;
            self.btn2.selected =TRUE;
            self.btn3.selected =TRUE;
            self.btn4.selected =TRUE;
            self.btn5.selected =FALSE;
            
            break;
        case 5:
            self.btn1.selected =TRUE;
            self.btn2.selected =TRUE;
            self.btn3.selected =TRUE;
            self.btn4.selected =TRUE;
            self.btn5.selected =TRUE;
            break;
            
        default:
            break;
    }

    
    
}




- (IBAction)back:(id)sender {
    
    [self.comments resignFirstResponder];
}
@end
