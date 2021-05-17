//
//  ViewController.swift
//  AkriviaDice
//
//  Created by Rise on 16/05/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locManager = CLLocationManager()
       var currentLocation: CLLocation!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var longAndLatitudeLbl: UILabel!
    @IBAction func rollBtnAction(_ sender: Any) {

        let firstNumber = Int.random(in: 0 ... 5)
        let secondNumber = Int.random(in: 0 ... 5)
        
        leftDiceImageView.image = UIImage(named: diceArray[firstNumber])
        rightDiceImageView.image = UIImage(named: diceArray[secondNumber])
        sumLbl.text = "Sum : \(firstNumber + secondNumber) Points"
       
    }
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6", ]

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var sumLbl: UILabel!
    @IBOutlet weak var rollBtn: UIButton!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    @IBOutlet weak var leftDiceImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locManager.delegate = self
            locManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locManager.startUpdatingLocation()
        }
        shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowRadius = 5
        // Do any additional setup after loading the view.
    }
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            //21.228124
            let lon: Double = Double("\(pdblLongitude)")!
            //72.833770
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                                        { [self](placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        print(pm.country!)
                        print(pm.locality!)
                        print(pm.subLocality!)
                        print(pm.thoroughfare!)
                        print(pm.postalCode!)
                        print(pm.subThoroughfare!)
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }


                        print(addressString)
                        addressLbl.text =  addressString
                  }
            })

        }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        longAndLatitudeLbl.text = "Latitude : \(locValue.latitude) , Longitude : \(locValue.longitude)"
        
        getAddressFromLatLon(pdblLatitude: String(locValue.latitude), withLongitude: String(locValue.longitude))
    }
}

