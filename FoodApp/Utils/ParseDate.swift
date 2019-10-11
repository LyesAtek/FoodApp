//
//  ParseDate.swift
//  FoodApp
//
//  Created by Lyes ATEK on 11/10/2019.
//  Copyright © 2019 Lyes ATEK. All rights reserved.
//

import Foundation

class ParseDate{
    
    static  func stringToDate(date:String) -> NSDate? {
        let formatter = DateFormatter()
    
    // Format 1
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate as NSDate
    }
    
    // Format 2
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate as NSDate
    }
    
    // Couldn't parsed with any format. Just get the date
        let splitedDate = date.components(separatedBy: "T")
    if splitedDate.count > 0 {
    formatter.dateFormat = "yyyy-MM-dd"
        if let parsedDate = formatter.date(from: splitedDate[0]) {
            return parsedDate as NSDate
    }
    }
    
    // Nothing worked!
        return nil
    }
}
