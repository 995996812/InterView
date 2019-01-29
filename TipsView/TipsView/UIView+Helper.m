//
//  UIView+Helper.m
//  Foomoo
//
//  Created by QFish on 5/5/14.
//  Copyright (c) 2014 QFish.inc. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)


@dynamic top;
@dynamic bottom;
@dynamic left;
@dynamic right;

@dynamic width;
@dynamic height;

@dynamic offset;
@dynamic position;
@dynamic size;

@dynamic x;
@dynamic y;
@dynamic w;
@dynamic h;

- (CGFloat)top
{
	return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
	CGRect frame = self.frame;
	frame.origin.y = top;
	self.frame = frame;
}

- (CGFloat)left
{
	return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
	CGRect frame = self.frame;
	frame.origin.x = left;
	self.frame = frame;
}

- (CGFloat)width
{
	return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)height
{
	return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    if ( !isnan(height) )
    {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
    }
}

- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
	self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
	self.frame = frame;
}

- (CGFloat)x
{
	return self.frame.origin.x;
}

- (void)setX:(CGFloat)value
{
	CGRect frame = self.frame;
	frame.origin.x = value;
	self.frame = frame;
}

- (CGFloat)y
{
	return self.frame.origin.y;
}

- (void)setY:(CGFloat)value
{
	CGRect frame = self.frame;
	frame.origin.y = value;
	self.frame = frame;
}

- (CGFloat)w
{
	return self.frame.size.width;
}

- (void)setW:(CGFloat)width
{
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (CGFloat)h
{
	return self.frame.size.height;
}

- (void)setH:(CGFloat)height
{
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGPoint)offset
{
	CGPoint		point = CGPointZero;
	UIView *	view = self;
    
	while ( view )
	{
		point.x += view.frame.origin.x;
		point.y += view.frame.origin.y;
		
		view = view.superview;
	}
	
	return point;
}

- (void)setOffset:(CGPoint)offset
{
	UIView * view = self;
	if ( nil == view )
		return;
    
	CGPoint point = offset;
    
	while ( view )
	{
		point.x += view.superview.frame.origin.x;
		point.y += view.superview.frame.origin.y;
        
		view = view.superview;
	}
    
    CGRect frame = self.frame;
	frame.origin = point;
	self.frame = frame;
}

- (CGPoint)position
{
	return self.frame.origin;
}

- (void)setPosition:(CGPoint)pos
{
    CGRect frame = self.frame;
	frame.origin = pos;
	self.frame = frame;
}

- (CGSize)size
{
	return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
	frame.size = size;
	self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)boundsCenter
{
    return CGPointMake( CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) );
}

- (void)floatWithOptions:(UIViewHelperLayoutOptions)options
{
    [self floatInView:self.superview options:options];
}

- (void)floatWithOptions:(UIViewHelperLayoutOptions)options margin:(UIEdgeInsets)margin
{
    [self floatInView:self.superview options:options margin:margin];
}

- (void)floatInView:(UIView *)view options:(UIViewHelperLayoutOptions)options
{
    [self floatInView:view options:options margin:UIEdgeInsetsZero];
}

- (void)floatInView:(UIView *)view options:(UIViewHelperLayoutOptions)options margin:(UIEdgeInsets)margin
{
    CGRect sFrame = self.frame;
    CGRect vFrame = view.frame;
    CGRect targetFrame = sFrame;
    
    if ( options & UIViewHelperLayoutOptionsLeft )
    {
        targetFrame.origin.x = 0 + margin.left;
    }
    else if ( options & UIViewHelperLayoutOptionsRight )
    {
        targetFrame.origin.x = vFrame.size.width - sFrame.size.width - margin.right;
    }
    else if ( options & UIViewHelperLayoutOptionsHCenter )
    {
        targetFrame.origin.x = (vFrame.size.width - sFrame.size.width) / 2.f + margin.left - margin.right;
    }
    
    if ( options & UIViewHelperLayoutOptionsTop )
    {
        targetFrame.origin.y = 0 + margin.top;
    }
    else if ( options & UIViewHelperLayoutOptionsBottom )
    {
        targetFrame.origin.y = vFrame.size.height - sFrame.size.height - margin.bottom;
    }
    else if ( options & UIViewHelperLayoutOptionsVCenter )
    {
        targetFrame.origin.y = (vFrame.size.height - sFrame.size.height) / 2.f + margin.top - margin.bottom;
    }
    
    self.frame = targetFrame;
}

- (void)alignToView:(UIView *)view options:(UIViewHelperLayoutOptions)options
{
    [self alignToView:view options:options margin:UIEdgeInsetsZero];
}

- (void)alignToView:(UIView *)view options:(UIViewHelperLayoutOptions)options margin:(UIEdgeInsets)margin
{
    CGRect sFrame = self.frame;
    CGRect vFrame = view.frame;
    CGRect targetFrame = sFrame;
    
    if ( options & UIViewHelperLayoutOptionsLeft )
    {
        targetFrame.origin.x = CGRectGetMinX(vFrame) - margin.right;
    }
    else if ( options & UIViewHelperLayoutOptionsRight )
    {
        targetFrame.origin.x = CGRectGetMaxX(vFrame) + margin.left;
    }
    else if ( options & UIViewHelperLayoutOptionsHCenter )
    {
        targetFrame.origin.x = CGRectGetMidX(vFrame) - sFrame.size.width / 2 + margin.left - margin.right;
    }
    
    if ( options & UIViewHelperLayoutOptionsTop )
    {
        targetFrame.origin.y = CGRectGetMinY(vFrame) - margin.bottom;
    }
    else if ( options & UIViewHelperLayoutOptionsBottom )
    {
        targetFrame.origin.y = CGRectGetMaxY(vFrame) + margin.top;
    }
    else if ( options & UIViewHelperLayoutOptionsVCenter )
    {
        targetFrame.origin.y = CGRectGetMidY(vFrame) - sFrame.size.height / 2 + margin.top - margin.bottom;
    }
    
    self.frame = targetFrame;
}

@end
