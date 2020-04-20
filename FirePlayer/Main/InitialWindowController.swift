//
//  InitialWindowController.swift
//  FirePlayer
//
//  Created by etiantian on 2020/4/20.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import SnapKit

fileprivate extension NSUserInterfaceItemIdentifier {
    static let openFile = NSUserInterfaceItemIdentifier("openFile")
    static let openURL = NSUserInterfaceItemIdentifier("openURL")
    static let resumeLast = NSUserInterfaceItemIdentifier("resumeLast")
}

fileprivate extension NSColor {
    static let initialWindowActionButtonBackground: NSColor = {
        return NSColor.blue
    }()
    static let initialWindowActionButtonBackgroundHover: NSColor = {
        return NSColor.red
    }()
    static let initialWindowActionButtonBackgroundPressed: NSColor = {
        return NSColor.green
    }()
    static let initialWindowLastFileBackground: NSColor = {
        return NSColor.purple
    }()
    static let initialWindowLastFileBackgroundHover: NSColor = {
        return NSColor.brown
    }()
    static let initialWindowLastFileBackgroundPressed: NSColor = {
        return NSColor.cyan
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
    @IBOutlet weak var openFileLabel: NSTextField!
    @IBOutlet weak var keyLabelFirst: NSTextField!
    
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
        setupOpenSubviews()
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
    
    func setupOpenSubviews() -> Void {
        openFileLabel.isEditable = false
        openFileLabel.stringValue = "Open..."
        
        keyLabelFirst.isEditable = false
        keyLabelFirst.stringValue = "kuaijie"
    }
    
}


/// Window Content View
class InitialWindowContentView: NSView {
    
}

class InitialWindowViewActionButton: NSView {

  var normalBackground = NSColor.initialWindowActionButtonBackground {
    didSet {
      self.layer?.backgroundColor = normalBackground.cgColor
    }
  }
  var hoverBackground = NSColor.initialWindowActionButtonBackgroundHover
  var pressedBackground = NSColor.initialWindowActionButtonBackgroundPressed

  var action: Selector?

  override func awakeFromNib() {
    self.wantsLayer = true
    self.layer?.cornerRadius = 4
    self.layer?.backgroundColor = NSColor.red.cgColor
    self.addTrackingArea(NSTrackingArea(rect: self.bounds, options: [.activeInKeyWindow, .mouseEnteredAndExited], owner: self, userInfo: nil))
  }

  override func mouseEntered(with event: NSEvent) {
    self.layer?.backgroundColor = hoverBackground.cgColor
  }

  override func mouseExited(with event: NSEvent) {
    self.layer?.backgroundColor = normalBackground.cgColor
  }

  override func mouseDown(with event: NSEvent) {
    self.layer?.backgroundColor = pressedBackground.cgColor
    if self.identifier == .openFile {
      (NSApp.delegate as! AppDelegate).openFile(self)
    } else if self.identifier == .openURL {
      (NSApp.delegate as! AppDelegate).openURL(self)
    } else {
//      if let lastFile = Preference.url(for: .iinaLastPlayedFilePath),
//        let windowController = window?.windowController as? InitialWindowController {
//        windowController.player.openURL(lastFile)
//      }
    }
  }

  override func mouseUp(with event: NSEvent) {
    self.layer?.backgroundColor = hoverBackground.cgColor
  }

}
