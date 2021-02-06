//
//  AppDelegate.swift
//  Notify
//
//  Created by Chris Patterson on 2/6/20.
//  Copyright © 2020 Chris Patterson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Set UNUserNotificationCenterDelegate
        UNUserNotificationCenter.current().delegate = self

        return true
    }

}

// Conform to UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter,
           willPresent notification: UNNotification,
           withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler(.alert)
    }

}

