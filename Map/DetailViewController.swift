//
//  DetailViewController.swift
//  Map
//
//  Created by Benjamin Pisano on 28/01/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTextView: UITextView!
    
    var detailtext: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.text = detailtext
    }
}
