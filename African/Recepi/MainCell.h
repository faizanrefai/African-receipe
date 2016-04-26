//
//  MainCell.h
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface MainCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet EGOImageView *mainImage;
@property (strong, nonatomic) IBOutlet UILabel *Lbl;

@end
