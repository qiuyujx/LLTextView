# Introduction
LLTextView is an placeholder enabled subclass of UITextView.

# Features
+ LLTextView is customisable
+ LLTextView supports configuration from User Defined Runtime Attributes in Storyboard
+ LLTextView placeholder is overlay that separated from text input, so feel free to use textView.text to get the actual text

# How to use LLTextView

Copy LLTextView.h & LLTextView.m to your project, and make sure that the references are added to correct target.

+ Configuration from Storyboard
Simply drag a UITextView from Object Library, and put it wherever you want on your storyboard.
Then, reveal "Utilities" of Xcode, select the UITextView and configure its in Identity Inspector as below

![Storyboard Configuration](http://roommateradar.com/imageReferences/LLTextViewConfig.png)

+ Configuration programmatically
Set placeholder text

    [self.textView setPlaceholderText:@"This is programmatically configured placeholder"];

Set placeholder color

    [self.textView setPlaceholderColor:[UIColor blackColor]];

Set placeholder animation duration

    [self.textView setPlaceholderAnimationDurationFloat:0.3];
    // Alternative setting placeholderAnimationDuration
    [self.textView setPlaceholderAnimationDuration:[NSNumber numberWithFloat:0.3]];

Set placeholderFrame

    [self.textView setPlaceholderBounds:CGRectMake(8, 8, self.textView.frame.size.width - 16, 0)];
    // Alternative setting placeholderFrame
    [self.textView setPlaceholderFrame:[NSValue valueWithCGRect:CGRectMake(8, 8, self.textView.frame.size.width - 16, 0)]];


### Please feel free to advise me in any aspects might improve this library
