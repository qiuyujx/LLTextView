//
//  ViewController.m
//  LLTextView
//
//  Created by TaoChristopher on 22/04/2015.
//  Copyright (c) 2015 L.L. Studio. All rights reserved.
//

#import "ViewController.h"
#import "LLTextView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet LLTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* * * * * * * * * * * * * * * * */
    /* How to customise LLTextView ? */
    /*                               */
    /*     There are two ways        */
    /* * * * * * * * * * * * * * * * */
    
    // 1. In storyboard
    //   -> select textview from scene
    //   -> select Identity Inspector from Utilities
    //   -> in User Define Runtime Attributes
    //   -> press + button
    //   -> you may add
    //      placeholderText (String)
    //      placeholderColor (Color)
    //      placeholderAnimationDuration (Number)
    //      placeholderFrame (CGRect)
    //   -> then, just simply run it, without programmatically configuring
    
    // 2. Programmatically
    // Realese the following comments to show a different style of placeholder
    // Note that all the customisable properties of LLTextView are begin with "Placeholder", which makes easier for programming :)
    
    
    // Set placeholderText
    [self.textView setPlaceholderText:@"This is programmatically configured placeholder"];
    // Set placeholderColor
    [self.textView setPlaceholderColor:[UIColor lightGrayColor]];
    // Set placeholderAnimationDuration
    [self.textView setPlaceholderAnimationDurationFloat:0.3];
        // Alternative setting placeholderAnimationDuration
    [self.textView setPlaceholderAnimationDuration:[NSNumber numberWithFloat:0.3]];
    // Set placeholderFrame
    [self.textView setPlaceholderBounds:CGRectMake(8, 8, 200, 0)];
        // Alternative setting placeholderFrame
    [self.textView setPlaceholderFrame:[NSValue valueWithCGRect:CGRectMake(8, 8, 200, 0)]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
