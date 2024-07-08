//
//  AddActivityView.swift
//  Activities
//
//  Created by Ambrose V on 08/07/2024.
//

import SwiftUI

struct AddActivityView: View {
    @State private var activityName = ""
    @State private var activityDescription = ""
    @State private var timeAmount = 0.0
    @Environment(\.dismiss) var dismiss
    var activities: Activities
    var body: some View {
        NavigationStack {
            Form {
                Section("Essentials") {
                    TextField("Activity Name", text: $activityName)
                        .font(.headline)
                    
                    TextField("Custom minutes", value: $timeAmount, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        
                }
                
                Section("Add a description") {
                    TextEditor(text: $activityDescription)
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 200)
                }
                    
                
            }
            
            .navigationTitle("Add an activity")
            
            Button("Save") {
                let item = ActivityItem(activityName: activityName, description: activityDescription, minutes: timeAmount)
                activities.items.append(item)
                dismiss()
            }
        }
    }
}

#Preview {
    AddActivityView(activities: Activities())
}
