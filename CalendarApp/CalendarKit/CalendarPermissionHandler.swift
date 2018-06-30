//
//  CalendarPermissionHandler.swift
//  CalendarKit
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import EventKit
import Foundation

public enum CalendarPermissionStatus {
    case granted
    case denied
}

public struct CalendarPermissionHandler {
    
    public static func requestPermission(then handler: @escaping (CalendarPermissionStatus) -> ()) {
        
        let status = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case .notDetermined:
            promptUserForCalendarPermission(then: handler)
        case .authorized:
            handler(.granted)
        case .denied, .restricted:
            handler(.denied)
        }
    }
}

private extension CalendarPermissionHandler {
    
    static func promptUserForCalendarPermission(then handler: @escaping (CalendarPermissionStatus) -> ()) {
        
        let store = EKEventStore()
        store.requestAccess(to: .event) { permissionGranted, error in
            DispatchQueue.main.async {
                if permissionGranted {
                    handler(.granted)
                }
                else {
                    handler(.denied)
                }
            }
        }
    }
}
