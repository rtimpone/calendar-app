//
//  EventCell.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CalendarKit
import Foundation
import UIKit

class EventCell: UITableViewCell, NibBased {
    
    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    func update(for event: Event) {
        
        circleView.backgroundColor = event.calendarColor
        topLabel.text = event.title
        bottomLabel.text = event.location
        rightLabel.text = event.isAllDay ? "All Day" : "\(event.startTime) - \(event.endTime)"
    }
}
