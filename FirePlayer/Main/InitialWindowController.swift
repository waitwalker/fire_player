//
//  InitialWindowController.swift
//  FirePlayer
//
//  Created by etiantian on 2020/4/20.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import SnapKit

class InitialWindowController: NSWindowController {
    
    @IBOutlet weak var IconImageView: NSImageView!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var versionLabel: NSTextField!
    
    
    override var windowNibName: NSNib.Name {
        return NSNib.Name("InitialWindowController")
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.isMovableByWindowBackground = true
        nameLabel.isEditable = false
        nameLabel.stringValue = "Fire"
        setupIconSubviews()
    }
    
    // 设置Icon相关
    func setupIconSubviews() -> Void {
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(IconImageView)
        }
        
        versionLabel.isEditable = false
        versionLabel.stringValue = "1.0.0"
        versionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(nameLabel)
        }
    }
    
}

class InitialWindowContentView: NSView {
    
}
