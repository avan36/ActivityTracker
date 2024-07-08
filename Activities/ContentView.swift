//
//  ContentView.swift
//  Activities
//
//  Created by Ambrose V on 08/07/2024.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable {
    var id = UUID()
    let activityName: String
    let description: String
    let minutes: Double
}

@Observable
class Activities {
    var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try?
                JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = [] //Initializes empty
    }
}

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivityView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) {item in
                    HStack {
                        Text(item.activityName)
                        Text(item.description)
                        Text("\(item.minutes) minutes")
                    }
                    
                }
            }
            .navigationTitle("Your activities")
            .toolbar {
                Button("Add activity", systemImage: "plus") {
                    showingAddActivityView = true
                }
            }
            .sheet(isPresented: $showingAddActivityView) {
                AddActivityView(activities: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
