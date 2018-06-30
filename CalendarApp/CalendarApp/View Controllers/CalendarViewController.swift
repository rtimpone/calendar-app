//
//  CalendarViewController.swift
//  CalendarApp
//
//  Created by Rob Timpone on 6/30/18.
//  Copyright © 2018 Rob Timpone. All rights reserved.
//

import Foundation
import UIKit

protocol CalendarViewControllerDelegate: class {
    func didSelectDate(_ date: Date)
}

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: CalendarViewControllerDelegate!
    
    var collectionViewHandler = CalendarCollectionViewHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewHandler.setupWith(collectionView: collectionView, delegate: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewHandler.updateCollectionViewLayout()
        collectionViewHandler.resizeCollectionView()
    }
}

extension CalendarViewController: CalendarCollectionViewHandlerDelegate {
    
    func didSelectDate(_ date: Date) {
        print("user selected item '\(date)'")
        delegate.didSelectDate(date)
    }
}
