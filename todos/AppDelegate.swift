//
//  AppDelegate.swift
//  todos
//
//  Created by Vijay Jambu on 2/23/16.
//  Copyright © 2016 Vijay Jambu. All rights reserved.
//

import UIKit


struct K {
    struct NotificationKey {
        static let OnboardingComplete = "kOnboardingComplete"
    }
    
    struct UserDefaultKey {
        static let OnboardingSeen = "kOnboardingSeen"
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)


        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        debugPrint("default is" , defaults.boolForKey(K.UserDefaultKey.OnboardingSeen))
        defaults.registerDefaults([K.UserDefaultKey.OnboardingSeen : false])
        

        self.showCorrectViewController();
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onboardingComplete" as Selector, name: K.NotificationKey.OnboardingComplete, object: nil)
        
        return true
    }
    
    func onboardingComplete(){
        self.showCorrectViewController()
    }
    
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func showCorrectViewController() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasSeenOnboarding = defaults.boolForKey(K.UserDefaultKey.OnboardingSeen)
        debugPrint( "hasSeenOnboarding", hasSeenOnboarding)
        
        var controller:UIViewController
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if hasSeenOnboarding {
                controller =  mainStoryboard.instantiateViewControllerWithIdentifier("MainViewTabViewController") as! MainViewTabViewController
        } else {
            controller = mainStoryboard.instantiateViewControllerWithIdentifier("OnboardingViewController") as! OnboardingViewController
        }
        
        self.window?.rootViewController = controller
        
        self.window?.makeKeyAndVisible()

    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

        NSUserDefaults.standardUserDefaults().synchronize()
                debugPrint("default is" , NSUserDefaults.standardUserDefaults().boolForKey(K.UserDefaultKey.OnboardingSeen))
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        self.showCorrectViewController()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

