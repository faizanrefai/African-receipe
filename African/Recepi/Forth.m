//
//  Forth.m
//  Recepi
//
//  Created by PRAKRUTI on 16/02/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import "Forth.h"

@interface Forth ()

@end

@implementation Forth
@synthesize toolBar;
@synthesize emailTx;
@synthesize commentTextView;

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
    [super viewDidLoad];    self.title = @"CONTACT";


    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"contact_select.png"] tag:3];
    [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"contact_select.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"contact.png"]];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0);

    commentTextView.layer.cornerRadius = 10;
    commentTextView.inputAccessoryView = toolBar;
  // [ (NavVC*)self.navigationController  lblb].text = @"CONTACT";
    // Do any additional setup after loading the view.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    



}



- (IBAction)sendClicked:(id)sender {
    
    if (!self.emailTx.text.length) {
        UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"Please enter email address" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [al show];
        return;
    }
    if (!self.commentTextView.text.length) {
        UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"Please enter comment address" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [al show];
        return;
    }
//          UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"Email sent" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [al show];
    
    [self mailSentButtonPresed];

}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void) mailSentButtonPresed{
   
    
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init] ;
    mailComposer.mailComposeDelegate = self;
    
    if ([MFMailComposeViewController canSendMail]) {
       
        [mailComposer setToRecipients: [NSArray arrayWithObject: self.emailTx.text]];
        [mailComposer setSubject:@"African Recipe"];
        [mailComposer setMessageBody:self.commentTextView.text isHTML:NO];
        
        mailComposer.navigationBar.tintColor = [UIColor brownColor];
        [self presentViewController:mailComposer animated:YES completion:nil];
    }
    
    
}



- (void)viewDidUnload
{
    [self setEmailTx:nil];
    [self setCommentTextView:nil];
    [self setToolBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backPressed:(id)sender {
    
    [commentTextView resignFirstResponder];
}
@end
