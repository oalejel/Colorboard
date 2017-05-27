//
//  PaletteViewController.m
//  Colorboard
//
//  Created by Omar Alejel on 9/5/14.
//  Copyright (c) 2014 Omar Alejel. All rights reserved.
//

#import "PaletteViewController.h"
#import "ColorViewController.h"
#import "ColorDescription.h"

@interface PaletteViewController ()

@property (nonatomic) NSMutableArray *colors;

@end

@implementation PaletteViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //table does not automatically reload data
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    //it might be considered good practice to do this so people that look at this code
    //understand what is going on
    ColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    UIView *coloredSquare = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    coloredSquare.backgroundColor = color.color;
    cell.accessoryView = coloredSquare;
    
    return cell;
}

- (NSMutableArray *)colors
{
    //you dont want to acess self.colors since it will only call this very getter
    if (!_colors) {
        _colors = [[NSMutableArray alloc] init];
        
        ColorDescription *description = [[ColorDescription alloc] init];
        [_colors addObject:description];
    }
    
    return _colors;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        //if adding a new color, create an instance and add it to array
        ColorDescription *description = [[ColorDescription alloc] init];
        [self.colors addObject:description];
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        ColorViewController *cvc = (ColorViewController *)nc.topViewController;
        cvc.colorDescription = description;
    } else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        //for the push segue, the sender is a cell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        ColorDescription *color = self.colors[ip.row];
        ColorViewController *cvc = (ColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}


@end
