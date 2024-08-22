//
//  Activity.swift
//  Activities
//
//  Created by Ambrose V on 21/07/2024.
//

import Foundation
import SwiftData


@Model
class Activity {
    var id = UUID()
    var activityName: String
    var activityType: String
    var desc: String
    var minutes: Double
    var startTime: Date
    var endTime: Date
    
    init(id: UUID = UUID(), activityName: String, activityType: String, description: String, minutes: Double, startTime: Date, endTime: Date) {
        self.id = id
        self.activityName = activityName
        self.activityType = activityType
        self.desc = description
        self.minutes = minutes
        self.startTime = startTime
        self.endTime = endTime
    }
    
}

