//
//  OpenURLWindowController.swift
//  FirePlayer
//
//  Created by etiantian on 2020/4/20.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class OpenURLWindowController: NSWindowController {
    @IBOutlet weak var openButton: NSButton!
    @IBOutlet weak var cancelButton: NSButton!
    
    override var windowNibName: NSNib.Name {
      return NSNib.Name("OpenURLWindowController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        window?.isMovableByWindowBackground = true
        window?.titlebarAppearsTransparent = true
        //window?.titleVisibility = .hidden
//        ([.closeButton, .miniaturizeButton, .zoomButton] as [NSWindow.ButtonType]).forEach {
//          window?.standardWindowButton($0)?.isHidden = true
//        }
        
        openButton.target = self
        openButton.action = #selector(openAction(_:))
    }
    
    override func cancelOperation(_ sender: Any?) {
        window?.close()
    }
    @IBAction func openAgainAction(_ sender: Any) {
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        window?.close()
    }
    
    @IBAction func openAction(_ sender: Any) {
        window?.close()
    }
}
