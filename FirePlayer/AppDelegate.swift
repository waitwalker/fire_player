//
//  AppDelegate.swift
//  FirePlayer
//
//  Created by etiantian on 2020/4/20.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        showWelcomeWindow()
    }
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    func showWelcomeWindow() -> Void {
        let window = InitialWindowController()
        window.showWindow(self)
    }
}

