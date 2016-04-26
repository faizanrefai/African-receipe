//
//  SubCategory.h
//  Recepi
//
//  Created by Maulik on 2/17/13.
//  Copyright (c) 2013 C4N TECHNOLOGY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCategory : UITableViewController  <UISearchBarDelegate>

@property (nonatomic,assign)NSDictionary* category;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UISearchBar *serchBarr;





@end
