//
//  LLTextView.h
//  LLTextView
//
//  Created by TaoChristopher on 22/04/2015.
//  Copyright (c) 2015 Longquan Tao & Lei Yang. All rights reserved.
//
//  Version 1.0

#import <UIKit/UIKit.h>

@interface LLTextView : UITextView

// Placeholder attributes
@property (nonatomic, retain) NSString *placeholderText;
@property (nonatomic, retain) UIColor *placeholderColor;
@property (nonatomic, retain) NSNumber *placeholderAnimationDuration;
@property (nonatomic, retain) NSValue *placeholderFrame;

- (void)textChanged:(NSNotification*)notification;
- (void)setPlaceholderAnimationDurationFloat:(float)duration;
- (void)setPlaceholderBounds:(CGRect)bounds;

@end
