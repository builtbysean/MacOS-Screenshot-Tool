//
//  MenuBarContentView.swift
//  ScreenshotApp
//
//  Created by Sean Coffin on 7/13/25.
//

import SwiftUI

struct MenuBarContentView: View {
    
    @ObservedObject var vm: ScreencaptureViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
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
            .contentMargins(20)
            .frame(maxHeight: 200)
            
            HStack {
                
                Button(action: {
                    vm.takeScreenshot(for: .area)
                }, label: {
                    Label("Take a area screenshot", systemImage: "rectangle.center.inset.filled.badge.plus")
                })
                
                Button(action: {
                    vm.takeScreenshot(for: .window)
                }, label: {
                    Label("Take a window screenshot", systemImage: "macwindow")
                })
                Button(action: {
                    vm.takeScreenshot(for: .full)
                }, label: {
                    Label("Take a full screenshot", systemImage: "macbook.gen2")
                })
            }
            .labelStyle(.iconOnly)
        }
        .padding()
    }
}

#Preview {
    MenuBarContentView(vm: ScreencaptureViewModel())
}
