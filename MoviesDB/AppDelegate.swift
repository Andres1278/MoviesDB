//
//  AppDelegate.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 15/04/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        MARK: Init VIPER Module
        let homeView = HomeWireFrame.createHomeModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeView
        window?.makeKeyAndVisible()
        return true
    }



}

