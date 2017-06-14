//
//  Constants.swift
//  RainyShine
//
//  Created by Rishi on 13/06/17.
//  Copyright © 2017 Rishi. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "59fcf70c8f597d1fc023a7eab6609beb"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=59fcf70c8f597d1fc023a7eab6609beb"





let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=12&mode=json&appid=59fcf70c8f597d1fc023a7eab6609beb"



