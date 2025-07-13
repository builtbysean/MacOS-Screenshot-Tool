import SwiftUI

class ScreencaptureViewModel: ObservableObject {
    
    enum ScreenshotTypes {
        case full
        case window
        case area
        
        var processArguments: [String] {
            switch self {
            case .full:
                return ["-c"]
            case .window:
                return ["-cw"]
            case .area:
                return ["-cs"]
            }
        }
    }
    
    @Published var images = [NSImage]()
    
    func takeScreenshot(for type: ScreenshotTypes) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = type.processArguments
        
        do {
            try task.run()
            task.waitUntilExit()
            getImageFromPasteboard()
        } catch {
            print("could not take screenshot: \(error)")
        }
    }
    
   private func getImageFromPasteboard() {
    
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else { return }
    
        guard let image = NSImage(pasteboard: NSPasteboard.general) else { return }
    
        self.images.append(image)
    }
}
