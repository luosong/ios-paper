//
//  MainViewController.m
//  paper
//
//  Created by Shali Nguyen on 6/20/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
- (IBAction)onPanDown:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *mainWrapper;
- (IBAction)onPanDown2:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *mainWrapper2;
@property (weak, nonatomic) IBOutlet UIView *test;
@property (nonatomic, assign) BOOL collapsed;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *contentView;
@end

@implementation MainViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPanDown:(id)sender {
    //broken, do nothing for now
}
- (IBAction)onPanDown2:(UIPanGestureRecognizer *)sender {
    NSLog(@"shali");
    
    CGPoint translation = [sender translationInView:self.view];
    CGPoint point = [sender locationInView:self.view];
    //CGPoint velocity = [sender velocityInView:self.view];
    
    int ymovement = translation.y;
    int framepos = self.view.frame.size.height - 50;
    CGRect frame = self.test.frame;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        NSLog(@"Gesture changed: %@", NSStringFromCGPoint(point));
        
        if (ymovement > 0) {
            if (self.collapsed) {
                frame.origin.y = framepos + (ymovement * 0.1);
            } else {
                frame.origin.y = ymovement;
            }
        } else {
            if (self.collapsed) {
                frame.origin.y = framepos +ymovement;
            } else {
                frame.origin.y = ymovement * 0.1;
            }
        }
        
    } else if (sender.state== UIGestureRecognizerStateEnded) {
        
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
        
        if (ymovement > 0) {
            frame.origin.y = framepos;
            self.collapsed = YES;
        }
        else {
            frame.origin.y = 0;
            self.collapsed = NO;
        }
    }
    
    [UIView animateWithDuration:1 animations:^{
        self.test.frame = frame;
    }];
}
@end
