//
//  EventListViewController.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CalendarKit
import Foundation
import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tableHandler: EventListTableHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableHandler = EventListTableHandler(tableView: tableView, delegate: self)
    }
    
    func displayEvents(_ events: [Event]) {
        tableHandler.showEvents(events)
    }
}

extension EventListViewController: EventListTableHandlerDelegate {
    
    func didSelectEvent(_ event: Event) {
        print("Did select event: \(event.title)")
    }
}
