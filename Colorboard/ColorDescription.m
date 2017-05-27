//
//  ColorDescription.m
//  Colorboard
//
//  Created by Omar Alejel on 9/5/14.
//  Copyright (c) 2014 Omar Alejel. All rights reserved.
//

#import "ColorDescription.h"

@implementation ColorDescription

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _color = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:1.0];
        _name = @"Blue";
    }
    
    return self;
}

@end
