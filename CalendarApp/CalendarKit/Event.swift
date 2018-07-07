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
    
    public var timeRangeString: String {
        return isAllDay ? "All Day" : "\(startTime) - \(endTime)"
    }
    
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
