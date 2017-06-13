//
//  WeatherVC.swift
//  RainyShine
//
//  Created by Rishi on 13/06/17.
//  Copyright © 2017 Rishi. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var CurrentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var currentWeather: CurrentWeather!
 
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        
        return cell 
    }
    
    
    func updateMainUI() {
        datelabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        CurrentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            
            
            
            self.updateMainUI()
        }
        
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

