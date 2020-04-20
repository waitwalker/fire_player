//
//  InitialWindowController.swift
//  FirePlayer
//
//  Created by etiantian on 2020/4/20.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class InitialWindowController: NSWindowController {
    
    override var windowNibName: NSNib.Name {
        return NSNib.Name("InitialWindowController")
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.isMovableByWindowBackground = true
    }
    
}

class InitialWindowContentView: NSView {
    
}
