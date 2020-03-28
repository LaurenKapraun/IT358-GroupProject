//
//  AppDelegate.swift
//  Prospective_Job_App
//
//  Created by Lauren Kapraun on 3/27/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Navigation Changes
        let navigationBarAppearace = UINavigationBar.appearance()
        
        // Change Navigation Background Color (Hex: 2AA4BF)
        navigationBarAppearace.barTintColor = UIColor(red: 42.0/255.0, green: 164.0/255.0, blue: 191.0/255.0, alpha: 1.0)
        
        // Change Text Color to White
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        // Change Navigation Font to Optima
        let navigationTitleFont = UIFont(name: "Lao Sangam MN", size: 30)!
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont]
   
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

