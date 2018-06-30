//
//  EventsFetcher.swift
//  CalendarKit
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import EventKit
import Foundation

public class EventsFetcher {
    
    lazy var store = EKEventStore()
    
    public init(){}
    
    public func fetchEvents(on date: Date) -> [Event] {
        
        let startOfDay = Calendar.current.startOfDay(for: date)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let calendars = store.calendars(for: .event)
        let predicate = store.predicateForEvents(withStart: startOfDay, end: endOfDay, calendars: calendars)
        let ekevents = store.events(matching: predicate)
        let events = ekevents.map { Event(event: $0) }

        return events
    }
}
