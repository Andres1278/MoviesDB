//
//  TabBarWireFrame.swift
//  MoviesDB
//
//  Created by Pedro Andres Villamil on 17/04/21.
//

import Foundation
import UIKit


class TabBarWireframe : NSObject {
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "NowPlayingView", bundle: Bundle.main)
    }

    let wireFrames:[UIViewController]

    init(_ wireFrames:UIViewController...) {
        self.wireFrames = wireFrames
        super.init()
    }

    private override init() {
        self.wireFrames = [UIViewController]()
    }

    func installIntoWindow(window: UIWindow) {
        
        guard let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController else {
            return
        }

        var viewControllers = [UIViewController]()

        for wireFrame in wireFrames {
            viewControllers.append(wireFrame)
        }
        tabBarController.viewControllers = viewControllers
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()

    }

}
