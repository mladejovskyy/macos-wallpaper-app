//
//  WallpaperSettings.swift
//  wallpaper-app
//
//  Created by Tomáš Mladějovský on 05.08.2025.
//

import Foundation

class WallpaperSettings: ObservableObject {
    @Published var dayWallpaperPath: String {
        didSet {
            UserDefaults.standard.set(dayWallpaperPath, forKey: "dayWallpaperPath")
            WallpaperManager.setWallpaperBasedOnTime()
        }
    }

    @Published var nightWallpaperPath: String {
        didSet {
            UserDefaults.standard.set(nightWallpaperPath, forKey: "nightWallpaperPath")
            WallpaperManager.setWallpaperBasedOnTime()
        }
    }
    
    @Published var isEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isEnabled, forKey: "isEnabled")
            if isEnabled {
                WallpaperManager.setWallpaperBasedOnTime()
            }
        }
    }

    init() {
        self.dayWallpaperPath = UserDefaults.standard.string(forKey: "dayWallpaperPath") ?? ""
        self.nightWallpaperPath = UserDefaults.standard.string(forKey: "nightWallpaperPath") ?? ""
        self.isEnabled = UserDefaults.standard.bool(forKey: "isEnabled")
    }
}
