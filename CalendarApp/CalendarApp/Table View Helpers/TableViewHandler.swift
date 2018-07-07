//
//  TableViewHandler.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation
import UIKit

class TableViewHandler: NSObject {
    
    weak var tableView: UITableView!
    var registeredCellNibNames = Set<String>()
    
    func dequeueReusableCell<CellType: NibBased>(ofType type: CellType.Type, for indexPath: IndexPath) -> CellType {
        
        let nibName = CellType.nibName
        
        if !registeredCellNibNames.contains(nibName) {
            let nib = UINib(nibName: nibName, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: nibName)
            registeredCellNibNames.insert(nibName)
        }
        
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: nibName, for: indexPath)
        
        guard let castedCell = dequeuedCell as? CellType else {
            fatalError("Unable to cast dequeued cell to type '\(nibName)'")
        }
        
        return castedCell
    }
}
