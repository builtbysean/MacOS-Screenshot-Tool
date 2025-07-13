import SwiftUI
import KeyboardShortcuts

struct KeyboardShortcutsSettingsView: View {
    var body: some View {
        Form {
            KeyboardShortcuts.Recorder("Screenshot Area:", name: .screenshotCapture)
            KeyboardShortcuts.Recorder("Screenshot Window:", name: .screenshotCaptureWindow)
            KeyboardShortcuts.Recorder("Screenshot Full Screen:", name: .screenshotCaptureFull)

        }
        .padding()
    }
}
#Preview {
    KeyboardShortcutsSettingsView()
}
