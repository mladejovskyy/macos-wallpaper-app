//
//  wallpaper_appApp.swift
//  wallpaper-app
//
//  Created by Tomáš Mladějovský on 05.08.2025.
//

import SwiftUI

@main
struct WallpaperAppApp: App {
    @StateObject var settings = WallpaperSettings()

    init() {
        // Initial run
        if UserDefaults.standard.bool(forKey: "isEnabled") {
            WallpaperManager.setWallpaperBasedOnTime()
        }

        // Start timer to re-check every X minutes
        Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { _ in // every 5 min
            if UserDefaults.standard.bool(forKey: "isEnabled") {
                WallpaperManager.setWallpaperBasedOnTime()
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
