//
//  WeatherVC.swift
//  RainyShine
//
//  Created by Rishi on 13/06/17.
//  Copyright © 2017 Rishi. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire


class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var CurrentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
      
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            currentWeather.downloadWeatherDetails {
                self.downloadForecastDate {
                    self.updateMainUI()
                }
                
                
                
                
            }
            
            print(Location.sharedInstance.latitude, Location.sharedInstance.longitude)
            
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
      
    }
    
    
    
    func downloadForecastDate (completed: @escaping DownloadComplete) {
        // Downloading Forecast Weather DATA for TableView
        Alamofire.request(FORECAST_URL).responseJSON { response in
        
            let result = response.result
            if let dict = result.value as? Dictionary<String , AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            completed()
        
        
        
        
        }
        
        
        
        
        
    }
    
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            
            cell.ConfigureCell(forecast: forecast)
            return cell
            
        } else {
            return WeatherCell()
        }
        
        
        
    }
    
    
    func updateMainUI() {
        datelabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        CurrentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    
 
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

