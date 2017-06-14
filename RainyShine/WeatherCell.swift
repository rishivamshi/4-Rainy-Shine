//
//  WeatherCell.swift
//  RainyShine
//
//  Created by Rishi on 14/06/17.
//  Copyright © 2017 Rishi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherTypw: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
            
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
        
   
    func ConfigureCell(forecast: Forecast) {
        
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherTypw.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
        
        
        
        
        
        
    }
    
    
    
    

   
}
