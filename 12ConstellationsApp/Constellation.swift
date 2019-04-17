//
//  Constellation.swift
//  12ConstellationsApp
//
//  Created by Shun-Ching, Chou on 2019/4/17.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import Foundation

class Constellation {
    var name: String
    var startDate: String
    var stopDate: String
    
    init(name: String, startDate: String, stopDate: String) {
        self.name = name
        self.startDate = startDate
        self.stopDate = stopDate
    }
    
    func checkInterval(dateComponent: DateComponents) -> Bool {
        if let date = dateComponent.date, let year = dateComponent.year {
            let start = "\(year)/\(self.startDate)"
            let end = "\(year)/\(self.stopDate)"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy/MM/dd"
            if startDate > stopDate {
                if let start1 = dateFormatter.date(from: start), let end1 = dateFormatter.date(from: "\(year)/12/31"), let start2 = dateFormatter.date(from: "\(year)/01/01"), let end2 = dateFormatter.date(from: end){
                    return DateInterval(start: start1, end: end1).contains(date) || DateInterval(start: start2, end: end2).contains(date)
                }
            } else {
                if let start = dateFormatter.date(from: start), let end = dateFormatter.date(from: end) {
                    return DateInterval(start: start, end: end).contains(date)
                }
            }
        }
        return false
    }
}
