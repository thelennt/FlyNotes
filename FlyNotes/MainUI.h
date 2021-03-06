//
//  MainUI.h
//  FlyNotes
//
//  Created by Nathan Thelen on 7/26/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordModeEventHandler.h"
#import "InitializeModeEventHandler.h"


@interface MainUI : UIViewController
{
    
    CGPoint lastPoint;
    CGFloat opacity;
    BOOL mouseSwiped;
    CGFloat brush;
    RecordModeEventHandler *recordHandler;
    InitializeModeEventHandler *initHandler;
    int canvasCounter;
    int currentStyle;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
//RecordHandler: (RecordModeEventHandler*) record InitializeHandler: (InitializeModeEventHandler*) init;
- (void) addEvent:(NSSet *)touches isNew:(bool)isNew;
//@property (strong, nonatomic) IBOutlet UIView *MainInterfaceView;


- (IBAction)PlayButton:(id)sender;
- (void)addHandlers:(RecordModeEventHandler*) record InitializeHandler: (InitializeModeEventHandler*) init;
- (void) activateEvent:(id)event;

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
- (IBAction)ButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;

@property (weak, nonatomic) IBOutlet UIButton *PlayPause;

@property (weak, nonatomic) IBOutlet UIButton *PreviousButton;

@property (weak, nonatomic) IBOutlet UISlider *TimeSlider;

@property (weak, nonatomic) IBOutlet UIButton *Next1;

@property (weak, nonatomic) IBOutlet UIButton *Select1;

@property (weak, nonatomic) IBOutlet UIButton *Select2;

@property (weak, nonatomic) IBOutlet UIButton *Select3;

- (IBAction)PlayPausePressed:(id)sender;
- (IBAction)Select1Pressed:(id)sender;

- (IBAction)Select2Pressed:(id)sender;

- (IBAction)Select3PRessed:(id)sender;
- (IBAction)Select4Pressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *TextBar;

- (IBAction)TextEdited:(id)sender;
- (IBAction)TextEditingDone:(id)sender;

- (IBAction)PreviousButtonPressed:(id)sender;



@end
