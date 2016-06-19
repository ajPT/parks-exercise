//
//  ParkCell.swift
//  parks-exercise
//
//  Created by Amadeu Andrade on 19/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ParkCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var parkName: UILabel!
    @IBOutlet weak var parkLat: UILabel!
    @IBOutlet weak var parkLong: UILabel!
    @IBOutlet weak var parkDesc: UILabel!
    
    
    //MARK: - Cell life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: - Cell Configuration
    
    func configureCell(park: Park) {
        parkName.text = park.parkName
        parkLat.text = park.parkLatitude
        parkLong.text = park.parkLongitude
        parkDesc.text = park.parkDescription
    }

}
