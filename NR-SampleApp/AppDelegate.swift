//
//  AppDelegate.swift
//  NR-SampleApp
//
//  Created by Edison Castro on 3/13/20.
//  Copyright © 2020 Edison Castro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NewRelic.start(withApplicationToken:"AAa4cda45386d1e3fa99ab5e8db961ebb926e49e69-NRMA")
        NewRelic.recordBreadcrumb("AppDelegate"
        , attributes:["Name" : "didFinishLaunchingWithOptions", "userId" : "SampleUser", "action" : "tapped", "location" : "AppDelegate:didFinishLaunchingWithOptions"])
        NewRelic.recordCustomEvent("MobileCustomEdTest", attributes: ["where" : "AppDelegate:didFinishLaunchingWithOptions", "value": 1])
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        NewRelic.recordCustomEvent("MobileCustomEdTest", attributes: ["where" : "AppDelegate:configurationForConnecting", "value": 2])
        NewRelic.recordBreadcrumb("AppDelegate"
        , attributes:["Name" : "configurationForConnecting", "userId" : "SampleUser", "action" : "tapped", "location" : "AppDelegate:configurationForConnecting"])
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        NewRelic.recordCustomEvent("MobileCustomEdTest", attributes: ["where" : "AppDelegate:didDiscardSceneSessions", "value": 3])
        NewRelic.recordBreadcrumb("AppDelegate"
               , attributes:["Name" : "didDiscardSceneSessions", "userId" : "SampleUser", "action" : "tapped", "location" : "AppDelegate:didDiscardSceneSessions"])
    }


}

