//
//  ContentView.swift
//  wallpaper-app
//
//  Created by Tomáš Mladějovský on 05.08.2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @EnvironmentObject var settings: WallpaperSettings

    var body: some View {
        VStack(spacing: 20) {
            WallpaperInputView(title: "Day Wallpaper", path: $settings.dayWallpaperPath)
            WallpaperInputView(title: "Night Wallpaper", path: $settings.nightWallpaperPath)

            Toggle("Enable Wallpaper Changer", isOn: $settings.isEnabled)
                .padding(.top, 10)

            Spacer()
        }
        .padding()
        .frame(width: 500, height: 200)
    }
}

struct WallpaperInputView: View {
    let title: String
    @Binding var path: String

    var body: some View {
        HStack {
            Text(title)
                .frame(width: 120, alignment: .leading)

            TextField("Select an image...", text: $path)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button {
                let panel = NSOpenPanel()
                panel.allowedContentTypes = [
                    .png, .jpeg, .heic, .bmp, .gif, .tiff
                ]
                panel.canChooseFiles = true
                panel.canChooseDirectories = false
                panel.allowsMultipleSelection = false
                panel.directoryURL = FileManager.default.homeDirectoryForCurrentUser

                if panel.runModal() == .OK, let url = panel.url {
                    path = url.path
                }
            } label: {
                Image(systemName: "folder")
                    .font(.title2)
            }
            .buttonStyle(BorderlessButtonStyle())
            .help("Choose image")
        }
    }
}
