//
//  EventListTableHandler.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CalendarKit
import Foundation
import UIKit

protocol EventListTableHandlerDelegate: class {
    func didSelectEvent(_ event: Event)
}

class EventListTableHandler: TableViewHandler {
    
    var events: [Event] = []
    var theme: Theme = Themes.standard
    weak var delegate: EventListTableHandlerDelegate!
    
    init(tableView: UITableView, delegate: EventListTableHandlerDelegate) {
        super.init()
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        self.delegate = delegate
    }
    
    func showEvents(_ events: [Event]) {
        self.events = events
        tableView.reloadData()
    }
}

extension EventListTableHandler: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        let cell = dequeueReusableCell(ofType: EventCell.self, for: indexPath)
        cell.update(for: event)
        return cell
    }
}

extension EventListTableHandler: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        delegate.didSelectEvent(event)
    }
}
