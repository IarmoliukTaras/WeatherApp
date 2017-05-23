//
//  Contants.swift
//  WeatherApp
//
//  Created by 123 on 22.05.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation


typealias DownloadComplete = () -> ()


let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"

let APPID = "&appid=b1b15e88fa797225412429c1c50c122a1"

let FULL_URL = BASE_URL + "lat=35&lon=139" + APPID
