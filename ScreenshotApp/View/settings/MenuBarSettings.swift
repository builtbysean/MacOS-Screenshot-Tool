import SwiftUI

struct MenuBarSettings: View {
    @AppStorage("menuBarExtraIsInserted") var menuBarExtraIsInserted = true
    
    var body: some View {
        Form {
            Toggle("Show menu bar extra", isOn: $menuBarExtraIsInserted)
        }
    }
}
