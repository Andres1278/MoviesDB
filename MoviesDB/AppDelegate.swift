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
        let nowPlayingView = NowPlayingWireFrame.createHomeModule()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = TabBarWireframe(nowPlayingView)
        tabBar.installIntoWindow(window: window)
        self.window = window
        return true
    }



}

