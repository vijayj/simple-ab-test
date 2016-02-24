//
//  ModelController.swift
//  todos
//
//  Created by Vijay Jambu on 2/23/16.
//  Copyright © 2016 Vijay Jambu. All rights reserved.
//

import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource {
    
    
    var pageData: [String] = []
    
    
    override init() {
        super.init()
        // Create the data model.
        let dateFormatter = NSDateFormatter()
        
        let messages = [
            "The best productivity tool ever to be built",
            "All your todos in one place",
            "Enter email",
            "Email plus todo's is the bomb",
            "Welcome to most productive day for rest of your life"
        ]
        
        pageData = messages;
    }
    
    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> UIViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        switch index {
        case 2: //changing march to return the login view controller instead
            return storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        default:
            // Create a new view controller and pass suitable data.
            let dataViewController = storyboard.instantiateViewControllerWithIdentifier("TutorialViewController") as! TutorialViewController
            dataViewController.dataObject = self.pageData[index]
            return dataViewController
        }
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageData.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        let index = indexOfViewController(pageViewController)
        return index == NSNotFound ? 0 : index
    }
    
    func indexOfViewController(viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        switch viewController {
        case is LoginViewController:
                return 2;
        case is TutorialViewController:
               return pageData.indexOf((viewController as! TutorialViewController).dataObject)!
        default:
           return NSNotFound;
        }
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! UIViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! UIViewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    


}
