//
//  Forth.h
//  Recepi
//
//  Created by PRAKRUTI on 16/02/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <QuartzCore/QuartzCore.h>

#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface Forth : UIViewController<UITextFieldDelegate ,MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTx;

@property (weak, nonatomic) IBOutlet UITextView *commentTextView;


- (IBAction)backPressed:(id)sender;


@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;




@end
