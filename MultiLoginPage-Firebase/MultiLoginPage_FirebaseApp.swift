//
//  MultiLoginPage_FirebaseApp.swift
//  MultiLoginPage-Firebase
//
//  Created by Антон Кулик on 26.08.2022.
//

import SwiftUI
import Firebase

@main
struct MultiLoginPage_FirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//MARK: Initializing Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    //MARK: Phone Auth Needs to Initialize Remote Notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return.noData
    }
}


