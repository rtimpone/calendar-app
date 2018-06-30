//
//  ViewController.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CalendarKit
import UIKit

class ViewController: UIViewController {

    let eventsFetcher = EventsFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CalendarPermissionHandler.requestPermission() { status in
            self.printEventsForToday()
        }
    }
    
    func printEventsForToday() {
        let today = Date().addingTimeInterval(-1 * 60 * 60 * 24)
        let events = eventsFetcher.fetchEvents(on: today)
        for event in events {
            print(event)
        }
    }
}
