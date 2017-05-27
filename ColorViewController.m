//
//  ColorViewController.m
//  Colorboard
//
//  Created by Omar Alejel on 9/1/14.
//  Copyright (c) 2014 Omar Alejel. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation ColorViewController



- (IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

- (IBAction)changeColor:(id)sender
{
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;
    
    self.view.backgroundColor = [UIColor colorWithRed:red
                                                green:green
                                                 blue:blue
                                                alpha:1.0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *color = self.colorDescription.color;
    CGFloat red, green, blue;
    [color getRed:&red
            green:&green
             blue:&blue
            alpha:nil];
    
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    self.view.backgroundColor = color;
    self.textField.text = self.colorDescription.name;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //remove default done button if it is an existing color
    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.colorDescription.color = self.view.backgroundColor;
    self.colorDescription.name = self.textField.text;
}

@end
