//
//  MinimalClocksApp.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import Firebase
import SwiftUI

@main
struct MinimalClocksApp: App {
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            GradientBackgroundView()
        }
    }
    init() { FirebaseApp.configure() }
}

