//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by 123 on 22.05.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherTypeLabel: UILabel!

    @IBOutlet weak var weatherTableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.dowloadWeatherDetails {
            //set up UI to load data
            self.updateMainUI()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  weatherTableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        tempLabel.text = String(currentWeather.currentTemp) + "°"
        weatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        weatherImage.image = UIImage(named: currentWeather.weatherType)
    }


}

