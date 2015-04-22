//
//  CTTextView.m
//  CTTextView
//
//  Created by TaoChristopher on 22/04/2015.
//  Copyright (c) 2015 Christopher Tao. All rights reserved.
//

#import "LLTextView.h"

@interface LLTextView ()

@property (nonatomic, retain) UILabel *placeholderLabel;

@end

@implementation LLTextView

#define kDefaultPlaceholderText @"Type Text here..."
#define kDefaultPlaceholderColor [UIColor lightGrayColor]
#define kDefaultPlaceholderAnimationDuration 0.3f
#define kDefaultPlaceholderFrame CGRectMake(8,8,self.bounds.size.width - 16,0)

// Setters
- (void)setPlaceholderAnimationDurationFloat:(float)duration{
    _placeholderAnimationDuration = [NSNumber numberWithFloat:duration];
}

- (void)setPlaceholderBounds:(CGRect)bounds{
    _placeholderFrame = [NSValue valueWithCGRect:bounds];
}

// Clear all the attributes when dealloc, as well as de-register from notification center
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
#if __has_feature(objc_arc)
#else
    [_placeHolderLabel release]; _placeholderLabel = nil;
    [_placeHolderText release]; _placeHolderText = nil;
    [_placeholderColor release]; _placeholderColor = nil;
    [_placeholderAnimationDuration release]; _placeholderAnimationDuration = nil;
    [_placeholderFrame release]; _placeholderFrame = nil;
    [_placeholder release]; _placeholder = nil;
    [super dealloc];
#endif
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    // User Defined Runtime Attributes in Interface Builder can be used to set placeholderText and placeholderColor in Interface Builder.
    
    // If placeholderText is not pre-defined, give a default text
    if (!self.placeholderText) {
        [self setPlaceholderText:kDefaultPlaceholderText];
    }
    
    // If placeholderColor is not pre-defined, give a default color
    if (!self.placeholderColor) {
        [self setPlaceholderColor:kDefaultPlaceholderColor];
    }
    
    // If placeholderAnimationDuration is not pre-defined, give a default time
    if (!self.placeholderAnimationDuration) {
        [self setPlaceholderAnimationDurationFloat:kDefaultPlaceholderAnimationDuration];
    }
    
    // Register textChanged event on NotificationCenter
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (id)initWithFrame:(CGRect)frame{
    
    if( (self = [super initWithFrame:frame]) ){
        [self setPlaceholderText:kDefaultPlaceholderText];
        [self setPlaceholderColor:kDefaultPlaceholderColor];
        [self setPlaceholderAnimationDurationFloat:kDefaultPlaceholderAnimationDuration];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification{
    
    // If placeholderText is set to null, do nothing
    if(self.placeholderText.length == 0){
        return;
    }
    
    // If placeholderText is available
    [UIView animateWithDuration:_placeholderAnimationDuration.floatValue animations:^{
        if(self.text.length == 0)
            [self.placeholderLabel setAlpha:1];
        else
            [self.placeholderLabel setAlpha:0];
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if (self.placeholderText.length > 0){ // Only do this when placeholderText exists
        
        if (_placeholderLabel == nil){ // If label is not existing, create it
            CGRect frame = _placeholderFrame?[_placeholderFrame CGRectValue]:kDefaultPlaceholderFrame;
            _placeholderLabel = [[UILabel alloc] initWithFrame:frame];
            _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeholderLabel.numberOfLines = 0;
            _placeholderLabel.font = self.font;
            _placeholderLabel.backgroundColor = [UIColor clearColor];
            _placeholderLabel.textColor = self.placeholderColor;
            _placeholderLabel.alpha = 0;
            [self addSubview:_placeholderLabel];
        }
        
        [_placeholderLabel setText:self.placeholderText];
        [_placeholderLabel sizeToFit];
        [self sendSubviewToBack:_placeholderLabel];
    }
    
    if(self.text.length == 0 && self.placeholderText.length > 0){
        [self.placeholderLabel setAlpha:1];
    }
    
    [super drawRect:rect];
}


@end
