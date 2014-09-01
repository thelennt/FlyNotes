//
//  MainUI.m
//  FlyNotes
//
//  Created by Nathan Thelen on 7/26/14.
//  Copyright (c) 2014 Nathan Thelen. All rights reserved.
//

#import "MainUI.h"
#import "AudioRecording.h"
#import "StyleViewController.h"
#import "SaveLocal.h"

@implementation MainUI

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
        RecordHandler: (RecordModeEventHandler*) record InitializeHandler: (InitializeModeEventHandler*) init
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    recordHandler = record;
    initHandler = init;
    currentStyle = 0;
    return self;
}

- (void)viewDidLoad
{
    NotesStore *tempNotes = [[NotesStore alloc]init];;
    NotesStore *tempCanvas;
    AudioRecording *recording = [[AudioRecording alloc]init];
    InitializeModeEventHandler *tempInit = [[InitializeModeEventHandler alloc]init];
    
    // Do any additional setup after loading the view.
    
    [self performSegueWithIdentifier:@"StyleScreen" sender:self];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 0.2
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo: nil repeats:YES];
    
     NSArray *pages = [tempInit ConvertFromPDFToImage:@"file://localhost/Users/thelenn1/Desktop/FlyNotes/FlyNotes/Canon.pdf"];
     SaveLocal* save = [[SaveLocal alloc]init:@"Testing123"];
     tempCanvas = [tempInit RecordModeReady:pages savetype:save];
    
    [self addHandlers:[[RecordModeEventHandler alloc] init:tempNotes canvasStore:tempCanvas recording:recording background:@"TestBackground"] InitializeHandler: tempInit ];

    
    UIImage* temp = [recordHandler getCurrentImage];
    [self.tempDrawImage setImage:[recordHandler getCurrentImage]];
    [self.mainImage setImage:[recordHandler getCurrentImage]];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addHandlers:(RecordModeEventHandler*) record InitializeHandler: (InitializeModeEventHandler*) init
{
    recordHandler = record;
    initHandler = init;
    canvasCounter = 0;
}

-(void)onTick:(NSTimer *)timer
{
    1==1;
    //do smth
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (IBAction)PlayButton:(id)sender
{
        [recordHandler playRecording];
}
- (IBAction)PlayPausePressed:(id)sender {

}

- (IBAction)Select1Pressed:(id)sender {
}

- (IBAction)Select2Pressed:(id)sender {
}

- (IBAction)Select3PRessed:(id)sender {
}

- (IBAction)Select4Pressed:(id)sender {
}
- (IBAction)TextEdited:(id)sender {
}

- (IBAction)TextEditingDone:(id)sender {
}

- (IBAction)PreviousButtonPressed:(id)sender {
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    [self addEvent:touches isNew:true];

    lastPoint = currentPoint;
    canvasCounter++;
}

- (void) addEvent:(NSSet *)touches isNew:(bool)isNew
{
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    ScribbleNoteEvent* event = [[ScribbleNoteEvent alloc] init:canvasCounter TimeStamp:[recordHandler getTime] Style:currentStyle x:currentPoint.x y:currentPoint.y newSelect:isNew];
    
    [recordHandler newEvent:event];
    [self activateEvent:event];
     canvasCounter++;
     lastPoint = currentPoint;
}

- (void) activateEvent:(ScribbleNoteEvent*)event
{
    if([[event eventType] isEqualToString:@"ScribbleNote"])
    {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        if([event newSelect] == false)
        {
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), [event x], [event y]);
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5 );
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
            CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
        
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
            [self.tempDrawImage setAlpha:1.0];
            UIGraphicsEndImageContext();
        }
    }
    if([[event eventType] isEqualToString:@"TextNote"])
    {
        
    }
    
    
}

- (IBAction)ButtonPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
    StyleViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"StyleViewController"];
    
[self.navigationController pushViewController:controller animated:YES];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self addEvent:touches isNew:false];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped)
    {
        [self addEvent:touches isNew:false];
    }
}

@end
