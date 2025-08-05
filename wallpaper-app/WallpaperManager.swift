//
//  WallpaperManager.swift
//  wallpaper-app
//
//  Created by Tomáš Mladějovský on 05.08.2025.
//

import Foundation
import AppKit

class WallpaperManager {
    static func setWallpaperBasedOnTime() {
        let now = Calendar.current.dateComponents([.hour], from: Date()).hour ?? 0

        let nightStart = 20
        let nightEnd = 7

        let dayPath = UserDefaults.standard.string(forKey: "dayWallpaperPath") ?? ""
        let nightPath = UserDefaults.standard.string(forKey: "nightWallpaperPath") ?? ""

        let wallpaperPath: String

        if now >= nightStart || now < nightEnd {
            wallpaperPath = nightPath
        } else {
            wallpaperPath = dayPath
        }

        guard !wallpaperPath.isEmpty else {
            print("No wallpaper path set.")
            return
        }

        let fileURL = URL(fileURLWithPath: wallpaperPath)

        for screen in NSScreen.screens {
            do {
                try NSWorkspace.shared.setDesktopImageURL(fileURL, for: screen, options: [:])
                print("Wallpaper set for screen: \(screen)")
            } catch {
                print("Failed to set wallpaper for screen \(screen): \(error)")
            }
        }
    }
}
