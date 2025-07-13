import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    
    static let screenshotCapture = Self("screenshotCapture",
                                        default: .init(.three, modifiers: [.option,.command]))
    static let screenshotCaptureWindow = Self("screenshotCapture",
                                        default: .init(.four, modifiers: [.option,.command]))
    static let screenshotCaptureFull = Self("screenshotCapture",
                                        default: .init(.five, modifiers: [.option,.command]))

}
