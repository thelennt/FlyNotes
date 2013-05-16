//
//  FlyNotesDetailViewController.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/15/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlyNotesDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
