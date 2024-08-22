//
//  ActivitiesApp.swift
//  Activities
//
//  Created by Ambrose V on 08/07/2024.
//

import SwiftUI
import SwiftData


@main
struct ActivitiesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Activity.self)
    }
}
