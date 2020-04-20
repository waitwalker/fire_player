//
//  InitialWindowController.swift
//  FirePlayer
//
//  Created by etiantian on 2020/4/20.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import SnapKit

fileprivate extension NSColor {
    static let initialWindowActionButtonBackground: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowActionButtonBackground)!
      } else {
        return NSColor(calibratedWhite: 0, alpha: 0)
      }
    }()
    static let initialWindowActionButtonBackgroundHover: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowActionButtonBackgroundHover)!
      } else {
        return NSColor(calibratedWhite: 0, alpha: 0.25)
      }
    }()
    static let initialWindowActionButtonBackgroundPressed: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowActionButtonBackgroundPressed)!
      } else {
        return NSColor(calibratedWhite: 0, alpha: 0.35)
      }
    }()
    static let initialWindowLastFileBackground: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowLastFileBackground)!
      } else {
        return NSColor(calibratedWhite: 1, alpha: 0.1)
      }
    }()
    static let initialWindowLastFileBackgroundHover: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowLastFileBackgroundHover)!
      } else {
        return NSColor(calibratedWhite: 0.5, alpha: 0.1)
      }
    }()
    static let initialWindowLastFileBackgroundPressed: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowLastFileBackgroundPressed)!
      } else {
        return NSColor(calibratedWhite: 0, alpha: 0.1)
      }
    }()
    static let initialWindowBetaLabel: NSColor = {
      if #available(macOS 10.14, *) {
        return NSColor(named: .initialWindowBetaLabel)!
      } else {
        return NSColor(calibratedRed: 1, green: 0.6, blue: 0.2, alpha: 1)
      }
    }()
}

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
    
    /// 设置Icon相关
    /// - Returns: Void
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


/// Window Content View
class InitialWindowContentView: NSView {
    
}
