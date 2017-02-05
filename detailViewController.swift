//
//  detailViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 03.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class detailViewController: UIViewController {
    var stringPassed = ""
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var map: MKMapView!

    /* in this function the detailController will get the address (stringPassed), 
     * which is passed from tableView controller and literally parses it
     * down into coordinates (longitude and latitude) with the help the class CLGeocoder
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = stringPassed
    
        let address = stringPassed
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address,completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if ((placemarks?.count)! > 0) {
                let topResult: CLPlacemark = (placemarks?[0])!
                let placemark: MKPlacemark = MKPlacemark(placemark: topResult)
                var region: MKCoordinateRegion = self.map.region
                
                region.center.latitude = (placemark.location?.coordinate.latitude)!
                region.center.longitude = (placemark.location?.coordinate.longitude)!
                
                region.span = MKCoordinateSpanMake(0.5, 0.5)
                self.map.setRegion(region, animated: true)
                self.map.addAnnotation(placemark)
                }
            }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
