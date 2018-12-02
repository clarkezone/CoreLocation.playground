import CoreLocation
import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

class GeoCoordDel : NSObject, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(manager.location?.coordinate.latitude)
        //println(locationMgr.location.coordinate.longitude)
    }
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, 
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            print("denied")
            
        case .authorizedWhenInUse:
            print("yea")
            break
            
        case .notDetermined, .authorizedAlways:
            print("yea")
            break
        }
    }
}

let locationManager = CLLocationManager()
locationManager.desiredAccuracy=kCLLocationAccuracyBest
locationManager.delegate = GeoCoordDel()
let status = CLLocationManager.authorizationStatus()

locationManager.requestWhenInUseAuthorization()

if  !CLLocationManager.locationServicesEnabled() {
    print("not available")
}


locationManager.startUpdatingLocation()



func printVal(thing: String?) {
    if let valid = thing {
        print(valid)
    } else {
        print("no value")
    }
}

// force unwrapping an optional value
let test : String? = "first example"
print(test!)

// using optional binding implemented in printVal
var test2 : String? = "cool"
printVal(thing:test)

test2 = nil
printVal(thing:test)
