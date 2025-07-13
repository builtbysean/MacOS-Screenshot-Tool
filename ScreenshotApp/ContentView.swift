//
//  ContentView.swift
//  ScreenshotApp
//
//  Created by Sean Coffin on 7/13/25.
//

import SwiftUI

struct ContentView: View {
    
  @StateObject var vm = ScreencaptureViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 300))]) {
                    ForEach(vm.images, id: \.self) { image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .onDrag({ NSItemProvider(object: image)})
                    }
                }
            }
            Button("Take a screenshot") {
                vm.takeScreenshot(for: .area)
            }
            Button("Window") {
                vm.takeScreenshot(for: .window)
            }
            Button("Fullscreen") {
                vm.takeScreenshot(for: .full)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
