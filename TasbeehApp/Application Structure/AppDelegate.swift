//
//  AppDelegate.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 14/09/1446 AH.
//
/*import UIKit
//import FirebaseCore

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
       // FirebaseApp.configure() // تهيئة Firebase

        return true
    }
}*/

import UIKit
import CoreLocation
// import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationManager = CLLocationManager() // كائن إدارة الموقع

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // FirebaseApp.configure() // إذا كنت ستستخدم Firebase
        
        requestLocationPermission() // طلب إذن الموقع

        return true
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization() // طلب الإذن عند الاستخدام
        // locationManager.requestAlwaysAuthorization() // إذا كنت تريد الوصول الدائم
    }
}
