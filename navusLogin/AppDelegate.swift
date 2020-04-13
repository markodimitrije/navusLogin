//
//  AppDelegate.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loadInitialScreen()
        return true
    }
    
    func loadInitialScreen() {
        let rootVC = LoginViewControllerFactory.make()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
        window?.makeKeyAndVisible()
    }

}

