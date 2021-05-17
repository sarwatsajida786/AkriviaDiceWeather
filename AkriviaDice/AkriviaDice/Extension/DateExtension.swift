//
//  DateExtension.swift
//  WeatherApp
//
//  Created by Muhammad Osama Naeem on 3/28/20.
//  Copyright © 2020 Muhammad Osama Naeem. All rights reserved.
//

import UIKit

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
