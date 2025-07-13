import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            KeyboardShortcutsSettingsView()
                .tabItem { Label("Keyboard", systemImage: "keyboard")
                    }
            MenuBarSettings()
                .tabItem { Label("Menu Bar", systemImage: "rectangle.topthird.inset.filled")}
        }
        .frame(minWidth: 300, minHeight: 200)
    }
}

#Preview {
    SettingsView()
}
