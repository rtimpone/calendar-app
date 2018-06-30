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
    var eventListController: EventListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CalendarPermissionHandler.requestPermission() { status in
            switch status {
            case .granted:
                #warning("jump to today")
            case .denied:
                #warning("show permission message")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cvc = segue.destination as? CalendarViewController {
            cvc.delegate = self
        }
        else if let elvc = segue.destination as? EventListViewController {
            eventListController = elvc
        }
    }
}

extension ContainerViewController: CalendarViewControllerDelegate {
    
    func didSelectDate(_ date: Date) {
        let events = eventsFetcher.fetchEvents(for: date)
        eventListController.displayEvents(events)
    }
}
