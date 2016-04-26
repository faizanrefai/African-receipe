//
//  DetailCeell.h
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>

@protocol detailCell <NSObject>

-(void)save:(NSInteger)i;

@end



@interface DetailCeell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webingIntegrity;
@property (weak, nonatomic) IBOutlet UIWebView *webDirection;

@property (strong, nonatomic) IBOutlet EGOImageView *img;
@property (strong,nonatomic)IBOutlet id del;

@property (strong,nonatomic) NSString *rating;
@property (strong, nonatomic) IBOutlet UILabel *titleName;


@property (strong, nonatomic) IBOutlet UITextView *ingredient;

@property (strong, nonatomic) IBOutlet UITextView *directions;
@property (strong, nonatomic) IBOutlet UIButton *addToFavBtn;




- (IBAction)addFav:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn1;
@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;
@property (strong, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic) IBOutlet UIButton *btn5;


@property (strong, nonatomic) IBOutlet UITextField *name;

- (IBAction)ratingPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;

- (IBAction)back:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *comments;

@property (strong, nonatomic) IBOutlet UIButton *post;


- (IBAction)posting:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *vireRev;


- (IBAction)vireRevirePressed:(id)sender;














































@end
