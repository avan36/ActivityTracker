//
//  ContentView.swift
//  Activities
//
//  Created by Ambrose V on 08/07/2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Activity]()
    @Query(sort: \Activity.activityName) var activities: [Activity]
    
    var body: some View {
        NavigationStack(path: $path) {
            List(activities) { activity in
                NavigationLink(value: activity) {
                    VStack(alignment: .leading){
                        HStack {
                            Text(activity.activityName)
                                .font(.headline)
                            Text(activity.activityType)
                        }
                        HStack {
                            Text("\(Int(activity.minutes)) mins")
                                .font(.subheadline)
                        }
                        
                            
                        
                    }
                            
              }
            }
            .navigationTitle("Activities")
            .navigationDestination(for: Activity.self) { activity in
                            AddActivityView(activity: activity)
                        }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let activity = Activity(activityName: "Sample", activityType: "Exercise", description: "", minutes: Double(60), startTime: Date.now, endTime: Date.now.addingTimeInterval(-10000))
                    modelContext.insert(activity)
                    path = [activity] //Pushes into the path
                    
                }
            }
        }
    }
    

}

#Preview {
    ContentView()
        .modelContainer(for: Activity.self)
}
