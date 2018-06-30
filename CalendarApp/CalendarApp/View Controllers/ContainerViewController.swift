//
//  ContainerViewController.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CalendarKit
import UIKit

class ContainerViewController: UIViewController {

    let eventsFetcher = EventsFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CalendarPermissionHandler.requestPermission() { status in
            //jump to today
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CalendarViewController {
            vc.delegate = self
        }
    }
}

extension ContainerViewController: CalendarViewControllerDelegate {
    
    func didSelectDate(_ date: Date) {
        let events = eventsFetcher.fetchEvents(on: date)
        for event in events {
            print(event)
        }
    }
}
