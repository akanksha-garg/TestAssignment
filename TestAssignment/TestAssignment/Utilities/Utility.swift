//
//  Utility.swift
//  TestAssignment
//
//  Created by Akanksha garg on 13/07/20.
//  Copyright © 2020 Akanksha garg. All rights reserved.
//

import Foundation
class Utility {
    
    class func remaningTime(_ startDate: Date?, end endDate: Date? = Date()) -> String? {
        
        var components: DateComponents?
        var days: Int
        var hour: Int
        var minutes: Int
        var durationString: String?
        
        if let startDate = startDate, let endDate = endDate {
            components = Calendar.current.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)
        }
        days = components?.day ?? 0
        hour = components?.hour ?? 0
        minutes = components?.minute ?? 0
        
        if days > 0 {
            
            if days > 1 {
                durationString = "\(days) days"
            } else {
                durationString = "\(days) day"
            }
            return durationString
        }
        
        if hour > 0 {
            
            if hour > 1 {
                durationString = "\(hour) hours"
            } else {
                durationString = "\(hour) hour"
            }
            return durationString
        }
        
        if minutes > 0 {
            
            if minutes > 1 {
                durationString = "\(minutes) minutes"
            } else {
                durationString = "\(minutes) minute"
            }
            return durationString
        }
        
        return ""
    }
    
    static func convertToDate(date: String, originalFormat: String) -> Date? {
        if !date.isEmpty {
            let dateOriginalFormat = DateFormatter()
            dateOriginalFormat.dateFormat = originalFormat
            let dateFromString = dateOriginalFormat.date(from: date)
            return dateFromString
        } else {
            return nil
        }
    }
}

