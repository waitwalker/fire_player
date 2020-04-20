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
    
    /// 通过file 打开
    /// - Parameter sender: menu item
    @IBAction func openFile(_ sender: Any) {
        let panel = NSOpenPanel()
        panel.title = "打开"
        panel.canCreateDirectories = false
        panel.canChooseFiles = true
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = true
        if panel.runModal() == .OK {
            
        }
    }
    
    @IBAction func openURL(_ sender: Any) {
        
        let openURLWindow = OpenURLWindowController()
        openURLWindow.showWindow(nil)
    }
}

