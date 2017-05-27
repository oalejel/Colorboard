//
//  ColorViewController.h
//  Colorboard
//
//  Created by Omar Alejel on 9/1/14.
//  Copyright (c) 2014 Omar Alejel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDescription.h"

@interface ColorViewController : UIViewController

@property (nonatomic) BOOL existingColor;
@property (nonatomic) ColorDescription *colorDescription;

@end
