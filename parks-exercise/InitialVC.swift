//
//  ViewController.swift
//  parks-exercise
//
//  Created by Amadeu Andrade on 19/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit
import Alamofire

class InitialVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    
    var parks = [Park]()
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfParks: UILabel!

    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Table View definitions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("ParkCell") as? ParkCell {
            cell.configureCell(parks[indexPath.row])
            return cell
        }
        return ParkCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowWebVC", sender: parks[indexPath.row].parkURL)
    }
    
    
    //MARK: - IBActions
    
    @IBAction func onReloadBtnPressed(sender: UIButton) {
        downloadParksInfo { 
            self.tableView.reloadData()
            self.numberOfParks.text = "THERE CURRENTLY ARE \(self.parks.count) PARKS RECORDED"
        }
    }

    
    //MARK: - Download Parks information
    
    func downloadParksInfo(completed: DownloadComplete) {
        var name: String!
        var lat: String!
        var long: String!
        var desc: String!
        
        let url = NSURL(string: URL_BASE)!
        Alamofire.request(.GET, url).responseJSON(completionHandler: { response in
            let result = response.result
            if let dict = result.value as? [Dictionary<String, AnyObject>] {
                for entry in dict {
                    if let geoDict = entry["geometry"] as? Dictionary<String, AnyObject> {
                        if let coordinates = geoDict["coordinates"] as? [AnyObject] {
                            long = String(coordinates[0])
                            lat = String(coordinates[1])
                        }
                    }
                    if let properties = entry["properties"] as? Dictionary<String, AnyObject> {
                        if let parkDescription = properties["desc_pt"] as? String {
                            desc = parkDescription
                        }
                        if let parkName = properties["name"] as? String {
                            name = parkName
                        }
                    }
                    let park = Park(name: name, lat: lat, long: long, desc: desc)
                    self.parks.append(park)
                }
            }
            completed()
        })
    }
    
    
    //MARK: - Prepare Data for Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowWebVC" {
            if let webVC = segue.destinationViewController as? WebVC {
                if let url = sender as? String {
                    webVC.url = url
                }
            }
        }
    }


}

