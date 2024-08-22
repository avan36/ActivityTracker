//
//  AddActivityView.swift
//  Activities
//
//  Created by Ambrose V on 08/07/2024.
//

import SwiftUI
import SwiftData

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var activity: Activity
    
    
    let activityTypeChoices = ["Choose", "Exercise", "Spiritual", "Goofing off", "Education", "Work", "Self care", "Travelling"]
    var body: some View {
        VStack {
            Form {
                Section("Edit core details") {
                    TextField("Activity name", text: $activity.activityName)
                        .font(.headline)
                    Slider(value: $activity.minutes, in: 0...200, step: 5)
                    Text("\($activity.minutes) minutes spent")
                        .foregroundColor(.secondary)
                }
                Picker("Select activity type", selection: $activity.activityType) {
                    ForEach(activityTypeChoices, id: \.self) {
                        Text($0)
                    }
                }
                Section("Add a description") {
                    TextEditor(text: $activity.desc)
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 200)
                    
                }
                
                
            }
            .navigationTitle(activity.activityName)
        }
    }
}

#Preview {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Activity.self, configurations: config)
        let activity = Activity(activityName: "Sample", activityType: "Exercise", description: "Yum!", minutes: 20, startTime: Date.now.addingTimeInterval(-1000), endTime: Date.now)
        
        return AddActivityView(activity: activity)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }

}
