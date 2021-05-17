//
//  NetworkManagerProtocol.swift
//  WeatherApp
//
//  Created by Muhammad Osama Naeem on 3/28/20.
//  Copyright © 2020 Muhammad Osama Naeem. All rights reserved.
//

import UIKit

protocol NetworkManagerProtocol {
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ())
    func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ())
    func fetchNextFiveWeatherForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ())
}
