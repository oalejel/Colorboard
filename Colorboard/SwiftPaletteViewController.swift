//
//  SwiftPaletteViewController.swift
//  Colorboard
//
//  Created by Omar Alejel on 9/4/14.
//  Copyright (c) 2014 Omar Alejel. All rights reserved.
//

import Foundation

class SwiftPaletteViewController: UITableViewController {
    
    //turn this into array
    var colors: NSMutableArray = NSMutableArray(object: ColorDescription())
    
    //dont need an init override for a storyboard controller
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell") as UITableViewCell
        
        let description: ColorDescription = colors[indexPath.row] as! ColorDescription
        cell.textLabel.text = description.name
        
        let coloredSquare = UIView(frame: CGRectMake(0, 0, 30, 30))
        coloredSquare.backgroundColor = description.color
        cell.accessoryView = coloredSquare
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        //check for this
        if segue.identifier == "NewColor" {
            let description = ColorDescription()
            colors.addObject(description)
            let nc: UINavigationController = segue.destinationViewController as! UINavigationController
            let cvc: ColorViewController = nc.topViewController as! ColorViewController
            cvc.colorDescription = description
        } else if segue.identifier == "ExistingColor" {
            let ip: NSIndexPath = tableView.indexPathForCell(sender as UITableViewCell)
            let description: ColorDescription = colors[ip.row] as! ColorDescription
            let cvc: ColorViewController = segue.destinationViewController as! ColorViewController
            cvc.colorDescription = description
            cvc.existingColor = true
        }
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(colors, forKey: "colors")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            colors = aDecoder.decodeObjectForKey("colors") as! NSMutableArray
    }

    
    
}
