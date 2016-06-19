//
//  Park.swift
//  parks-exercise
//
//  Created by Amadeu Andrade on 19/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Park {
    
    //MARK: - Properties
    
    private var _parkName: String!
    private var _parkLatitude: String!
    private var _parkLongitude: String!
    private var _parkDescription: String!
    private var _parkUrl: String!
    
    //MARK: - Computed Properties
    
    var parkName: String {
        return _parkName
    }
    
    var parkLatitude: String {
        return _parkLatitude
    }
    
    var parkLongitude: String {
        return _parkLongitude
    }
    
    var parkDescription: String {
        return _parkDescription
    }
    
    var parkURL: String {
        return _parkUrl
    }
    
    
    //MARK: - Initializer
    
    init(name: String, lat: String, long: String, desc: String) {
        _parkName = name
        _parkLatitude = lat
        _parkLongitude = long
        _parkDescription = desc
        _parkUrl = "https://google.com/maps/place/\(_parkLatitude),\(_parkLongitude)"
    }
    

}