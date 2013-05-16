//
//  FlyNotesMasterViewController.h
//  FlyNotes
//
//  Created by Nathan Thelen on 5/15/13.
//  Copyright (c) 2013 Nathan Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlyNotesDetailViewController;

@interface FlyNotesMasterViewController : UITableViewController

@property (strong, nonatomic) FlyNotesDetailViewController *detailViewController;

@end
