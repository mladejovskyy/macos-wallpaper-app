//
//  wallpaper_appApp.swift
//  wallpaper-app
//
//  Created by Tomáš Mladějovský on 05.08.2025.
//

import SwiftUI

@main
struct WallpaperAppApp: App {
    init() {
        WallpaperManager.setWallpaperBasedOnTime()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
