//
//  AppDelegate.swift
//  AudioInjectorX
//
//  Created by rory on 10/4/18.
//  Copyright © 2018 arch64. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var gitlink: NSTextField!
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    @IBAction func quit(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    @IBAction func openAbout(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        window.makeKeyAndOrderFront(Any?.self)
    }
    
    @objc func link(sender: NSGestureRecognizer) {
        NSWorkspace.shared.open(URL(string: "https://github.com/pinecat/audioinjectorx")!)
    }
    
    func runSound() {
        while true {
            NSSound(named: NSSound.Name("2hz"))?.play()
            sleep(180)
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let icon = NSImage(named: NSImage.Name("statusIcon"))
        icon?.isTemplate = true
        statusItem.image = icon
        //statusItem.title = "AudioInjectorX"
        statusItem.menu = statusMenu
        
        let path = NSSearchPathForDirectoriesInDomains(.allLibrariesDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("Sounds/2hz.aif") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: filePath) {
                let alert: NSAlert = NSAlert()
                alert.messageText = "Cannot find audio file!"
                alert.informativeText = "Download the audio file from:\nhttps://github.com/pinecat/audioinjectorx/2hz.aif\n\n" +
                "Then place it in in your library directory:\n(~/Library/Sounds/2hz.aif)"
                alert.runModal()
                NSApplication.shared.terminate(self)
            }
        } else {
            let alert: NSAlert = NSAlert()
            alert.messageText = "Invalid Library Path! Quitting..."
            alert.informativeText = "Must have Sounds directory in library:\n(~/Library/Sounds)"
            alert.runModal()
            NSApplication.shared.terminate(self)
        }
        
        let gesture = NSClickGestureRecognizer()
        gesture.buttonMask = 0x1 // left mouse
        gesture.numberOfClicksRequired = 1
        gesture.target = self
        gesture.action = #selector(AppDelegate.link)
        
        gitlink.addGestureRecognizer(gesture)
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.runSound()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

