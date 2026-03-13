import SwiftUI

@main
struct NvimCheatsheetWidgetApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var widgetWindow: NSWindow?
    var cheatsheetWindow: NSWindow?
    var widgetView: WidgetView?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide from dock - make it a menu bar / desktop accessory app
        NSApp.setActivationPolicy(.accessory)
        
        createMenuBarIcon()
        createWidgetWindow()
    }
    
    func createMenuBarIcon() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "command", accessibilityDescription: "Neovim Cheatsheet")
            button.imagePosition = .imageLeading
        }
        
        let menu = NSMenu()
        
        let cheatsheetItem = NSMenuItem(title: "Open Cheatsheet", action: #selector(openCheatsheet), keyEquivalent: "c")
        cheatsheetItem.target = self
        menu.addItem(cheatsheetItem)
        
        let widgetItem = NSMenuItem(title: "Show Widget", action: #selector(showWidget), keyEquivalent: "w")
        widgetItem.target = self
        menu.addItem(widgetItem)
        
        menu.addItem(NSMenuItem.separator())
        
        let quitItem = NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)
        
        statusItem?.menu = menu
    }
    
    @objc func openCheatsheet() {
        showCheatsheet()
    }
    
    @objc func showWidget() {
        if widgetWindow == nil {
            createWidgetWindow()
        } else {
            widgetWindow?.makeKeyAndOrderFront(nil)
        }
    }
    
    @objc func quitApp() {
        NSApp.terminate(nil)
    }
    
    func createWidgetWindow() {
        let widgetView = WidgetView(
            onExpand: { [weak self] in
                self?.showCheatsheet()
            },
            onClose: { [weak self] in
                self?.closeWidget()
            }
        )
        self.widgetView = widgetView
        
        let hostingView = NSHostingView(rootView: widgetView)
        hostingView.frame = NSRect(x: 0, y: 0, width: 220, height: 160)
        
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 220, height: 160),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        window.contentView = hostingView
        window.isOpaque = false
        window.backgroundColor = .clear
        window.hasShadow = true
        window.level = .floating
        window.collectionBehavior = [.canJoinAllSpaces, .stationary, .fullScreenAuxiliary]
        window.isMovableByWindowBackground = true
        window.acceptsMouseMovedEvents = true
        
        // Position in bottom-right corner with padding
        if let screen = NSScreen.main {
            let screenFrame = screen.visibleFrame
            let x = screenFrame.origin.x + screenFrame.width - 240
            let y = screenFrame.origin.y + 20
            window.setFrameOrigin(NSPoint(x: x, y: y))
        }
        
        window.makeKeyAndOrderFront(nil)
        widgetWindow = window
    }
    
    func closeWidget() {
        widgetWindow?.orderOut(nil)
        widgetWindow = nil
    }
    
    func showCheatsheet() {
        if let existing = cheatsheetWindow {
            existing.makeKeyAndOrderFront(nil)
            NSApp.activate(ignoringOtherApps: true)
            return
        }
        
        let cheatsheetView = CheatsheetView(onClose: { [weak self] in
            self?.cheatsheetWindow?.orderOut(nil)
        })
        
        let hostingView = NSHostingView(rootView: cheatsheetView)
        hostingView.frame = NSRect(x: 0, y: 0, width: 900, height: 700)
        
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 900, height: 700),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        window.title = "Neovim Cheatsheet"
        window.contentView = hostingView
        window.center()
        window.level = .floating
        window.isReleasedWhenClosed = false
        
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        cheatsheetWindow = window
    }
}
