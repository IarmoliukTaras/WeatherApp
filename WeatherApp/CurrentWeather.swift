//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by 123 on 22.05.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
     private var _cityName: String!
     private var _date:String!
     private var _weatherType: String!
     private var _currentTemp: Int!
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormater = DateFormatter()
        
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        
        let currentDate = dateFormater.string(from: Date())
        self._date = "Today, " + currentDate
        
        return _date
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        
        return _currentTemp
    }
    
    func dowloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        let currentWeatherURL = URL(string: FULL_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = Int(temp - 273.15)
                    }
                }
            }
            completed()
        }
    }
}
