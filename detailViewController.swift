//
//  detailViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 04.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class detailViewController: UIViewController {
    var stringPassed = ""
    @IBOutlet var detailLabel: UILabel!
    
    @IBOutlet var map: MKMapView!
    var  initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = stringPassed
        
       /*
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(52.415005, 13.355747)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
    
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "MY SHOP"
        annotation.subtitle = "COME VISIT ME HERE!"
        map.addAnnotation(annotation)
        */
    
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
     /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
