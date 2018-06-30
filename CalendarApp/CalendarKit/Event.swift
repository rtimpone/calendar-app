//
//  Event.swift
//  CalendarKit
//
//  Created by Rob Timpone on 6/6/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import EventKit
import Foundation

public struct Event {
    
    public var title: String
    public var location: String? = nil
    public var startTime: String
    public var endTime: String
    public var isAllDay: Bool
    public var calendar: String
    public var calendarColor: UIColor
    
    init(event: EKEvent) {
        
        title = event.title
        
        if let location = event.location, !location.isEmpty {
            self.location = location
        }
        
        startTime = Event.timeString(from: event.startDate)
        endTime = Event.timeString(from: event.endDate)
        
        isAllDay = event.isAllDay
        
        calendar = event.calendar.title
        calendarColor = UIColor(cgColor: event.calendar.cgColor)
    }
    
    var consoleOutput: String {
        
        var output = "\(title)\n"
        
        if isAllDay {
            output += "All Day\n"
        }
        else {
            output += "\(startTime) - \(endTime)\n"
        }
        
        if let location = location {
            output += "\(location)\n"
        }
        
        output += "\(calendar)\n"
        
        return output
    }
}

private extension Event {
    
    private static var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        return df
    }
    
    private static func timeString(from date: Date) -> String {
        return Event.dateFormatter.string(from: date)
    }
}
