//
//  TriviaGameApp.swift
//  TriviaGame

import SwiftUI
import Foundation
import CoreData

@main
struct TriviaGameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
        
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        return true
    }
}

