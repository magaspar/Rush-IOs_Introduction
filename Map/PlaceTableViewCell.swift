//
//  PlaceTableViewCell.swift
//  Map
//
//  Created by Benjamin Pisano on 27/01/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import UIKit
import MapKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mapView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
