//
//  IntExtension.swift
//  WeatherApp
//
//  Created by Muhammad Osama Naeem on 3/31/20.
//  Copyright © 2020 Muhammad Osama Naeem. All rights reserved.
//

import UIKit

extension Int {
    func incrementWeekDays(by num: Int) -> Int {
        let incrementedVal = self + num
        let mod = incrementedVal % 7
        
        return mod
    }
}
