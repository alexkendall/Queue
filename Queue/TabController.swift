//
//  TabController.swift
//  Queue
//
//  Created by Alex Harrison on 12/22/15.
//  Copyright © 2015 Alex Harrison. All rights reserved.
//

import Foundation
import UIKit


// TAB CONTROLLER CLASS -> IMPLEMENTS TAB CONTROLLER WITH OPTION TO USE HIGH RESOLUTION CORE GRAPHICS ICONS
class TabController: UIViewController
{
    // container for storing tab bar buttons
    var tab_view:UIView!;
    var viewControllers:[UIViewController]!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // configure tab container
        let tab_height:CGFloat = 50.0;
        let tab_offset_y:CGFloat = self.view.bounds.height - tab_height;
        let tab_width:CGFloat = self.view.bounds.width;
        self.tab_view = UIView(frame: CGRect(x: 0.0, y: tab_offset_y, width: tab_width, height: tab_height));
        self.view.addSubview(tab_view);
        
        
        setBackgroundColor(UIColor.whiteColor());
        self.viewControllers = [UIViewController]();
        
    }
    
    func setChildrenViewControllers(viewControllers:[UIViewController])
    {
        let num_controllers:Int = viewControllers.count;
        let span:CGFloat = self.view.bounds.width / CGFloat(num_controllers);
        for(var i = 0; i < viewControllers.count; ++i)
        {
            let offset_x:CGFloat = span * CGFloat(i);
            let height = self.tab_view.bounds.height;
            let tab_button:UIButton = UIButton(frame: CGRect(x: offset_x, y: 0.0, width: span, height: height));
            self.tab_view.addSubview(tab_button);
            tab_button.tag = i;
            
        }
    }
    
    func setBackgroundColor(color:UIColor)
    {
        self.tab_view.backgroundColor = color;
    }
    
    func selectViewController(sender:UIButton)
    {
        let selected_indx:Int = sender.tag;
        for(var i = 0; i < self.viewControllers.count; ++i)
        {
            let controller = self.viewControllers[selected_indx];
            if(i == selected_indx)
            {
                self.view.addSubview(controller.view);
            }
            else
            {
                controller.view.removeFromSuperview();
            }
        }
    }
}