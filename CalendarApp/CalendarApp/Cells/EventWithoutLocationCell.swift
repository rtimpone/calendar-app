//
//  EventWithoutLocationCell.swift
//  CalendarApp
//
//  Created by Rob Timpone on 7/7/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import CalendarKit
import Foundation
import UIKit

class EventWithoutLocationCell: UITableViewCell, NibBased {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeRangeLabel: UILabel!
    
    func update(for event: Event) {
        
        titleLabel.text = event.title
        timeRangeLabel.text = event.timeRangeString
    }
}
