//
//  ViewController.swift
//  Foodlog
//
//  Created by jeanwei on 2020/6/20.
//  Copyright © 2020 jeanwei. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    //1.創建locationManager
   
    @IBAction func myLocation(_ sender: UIButton) {
     //   let location = mapView.userLocation
        let ann = MKPointAnnotation()
        //座標
        ann.coordinate = CLLocationCoordinate2D(latitude:24.172272,longitude: 120.695697)
        mapView.addAnnotation(ann)
      //縮小到座標 比例尺300,
        let region = MKCoordinateRegion(center: ann.coordinate,latitudinalMeters: 300,longitudinalMeters: 300)
        mapView.setRegion(region, animated: true)
       
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
       
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
        //2.配置locationManager
    /*    locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //3.配置mapview
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        //4.加入測試數據
        setupData()
    }
    override func viewWillAppear(_ animated: Bool) {
        //1.還沒有詢問過用戶已獲得權限
        if CLLocationManager.authorizationStatus() == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        }
        //2.用戶不同意
        else if CLLocationManager.authorizationStatus() == .denied{
            _ = UIAlertController(title: "Hello", message: "How are you?", preferredStyle: .alert)
        }
        //3.用戶已經同意
        else if CLLocationManager.authorizationStatus() == .authorizedAlways{
            locationManager.startUpdatingLocation()
        }
        
    }
    func setupData(){
        //1.檢察系統是否能夠監視region
        if CLLocationManager .isMonitoringAvailable(for: CLCircularRegion.self) {
             // 2.準備 region 會用到的相關屬性
                    let title = "Lorrenzillo's"
                    let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
                    let regionRadius = 300.0

                    // 3. 設置 region 的相關屬性
                    let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                        longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoring(for: region)

                    // 4. 創建大頭釘(annotation)
                    let restaurantAnnotation = MKPointAnnotation()
                    restaurantAnnotation.coordinate = coordinate;
                    restaurantAnnotation.title = "\(title)";
                    mapView.addAnnotation(restaurantAnnotation)

                    // 5. 繪製一個圓圈圖形（用於表示 region 的範圍）
            let circle = MKCircle(center: coordinate, radius: regionRadius)
                    mapView.addOverlay(circle)
                }
                else {
                    print("System can't track regions")
                }
            }

            // 6. 繪製圓圈
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
                let circleRenderer = MKCircleRenderer(overlay: overlay)
                circleRenderer.strokeColor = UIColor.red
                circleRenderer.lineWidth = 1.0
                return circleRenderer
            }
    // 1. 當用戶進入一個 region
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
    }

    // 2. 當用戶退出一個 region
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
         let canceAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
    } */
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
               if annotation is MKUserLocation {
                   return nil
            }
                   // 建立可重複使用的 MKAnnotationView
                   let reuseId = "MyPin"
                   var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
                   if pinView == nil {
                       // 建立一個地圖圖示視圖
                       pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            }
                      
                    
                    pinView?.isDraggable = true
                      
                   
                   return pinView
               }

                   



   }

}


