//
//  Subclass.m
//  UIViewSubclass
//
//  Created by Adam Gall on 3/24/16.
//  Copyright © 2016 AcmeCo. All rights reserved.
//

#import "Subclass.h"

@interface Subclass ()

@property (nonatomic, strong) IBOutlet UIView *view;

@end

@implementation Subclass

- (instancetype)init {
    if (self = [super init]) {
        [self initializeView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeView];
    }
    return self;
}

- (void)initializeView {
    // this does not need to be modified
    // all subviews and constrains can be defined direclty in Subclass.xib
    // in your own implementation, be sure to set the File's Owner in
    // Subclass.xib to "Subclass", and hook up the IBOutlet UIView to the view in the .xib
    
    // self.view is nil until the next line is executed
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    
    // take the view loaded into self.view (the root view from Subclass.xib)
    // and add it as a subview to our current instance of Subclass
    [self addSubview:self.view];
    
    // make autolayout work
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    // apply 0pt top/bottom/left/right constraints from ourself
    // (an instance of UIView) to the subview that we just added (self.view)
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
}

@end
