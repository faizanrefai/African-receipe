//
//  ReviewCell.h
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewCell : UITableViewCell



@property (strong, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UIButton *btn1;

@property (strong, nonatomic) IBOutlet UIButton *btn2;
@property (strong, nonatomic) IBOutlet UIButton *btn3;

@property (strong, nonatomic) IBOutlet UILabel *comment;

@property (strong, nonatomic) IBOutlet UIButton *btn4;

@property (strong, nonatomic) IBOutlet UIButton *btn5;

@end
