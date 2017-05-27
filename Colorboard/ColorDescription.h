//
//  ColorDescription.h
//  Colorboard
//
//  Created by Omar Alejel on 9/5/14.
//  Copyright (c) 2014 Omar Alejel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorDescription : NSObject

//classes like this usually dont take too much code since they are
//only meant to hold a package of data
@property (nonatomic) UIColor *color;
@property (nonatomic) NSString *name;

@end
