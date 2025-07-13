import SwiftUI

@main
struct ScreenshotAppApp: App {
    
    @StateObject var vm = ScreencaptureViewModel()
    
@AppStorage("menuBarExtraIsInserted") var menuBarExtraIsInserted = true
    
    var body: some Scene {
        MenuBarExtra("Screenshot", systemImage: "photo.badge.plus") {
            MenuBarContentView(vm:vm)
        }
        .menuBarExtraStyle(.window)
        
        Settings {
            SettingsView()
        }
    }
}
