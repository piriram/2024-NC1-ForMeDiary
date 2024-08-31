//
//  DateFormatterManager.swift
//  NC1
//
//  Created by ram on 8/31/24.
//

import Foundation

final class DateFormatterManager {
    static let shared = DateFormatterManager()
    
    private init() {}
    
    let fullDateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    let shortDateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func formatFullDate(dateString: String?) -> String {
        guard let dateString = dateString, let date = fullDateFormatter1.date(from: dateString) else {
            return ""
        }
        return shortDateFormatter1.string(from: date)
    }
    
    func formatSectionHeader(dateString: String) -> String {
        guard let date = shortDateFormatter1.date(from: dateString) else {
            return dateString
        }
        
        let today = Calendar.current.startOfDay(for: Date())
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        
        if Calendar.current.isDate(date, inSameDayAs: today) {
            return "Today"
        } else if Calendar.current.isDate(date, inSameDayAs: yesterday) {
            return "Yesterday"
        } else {
            return dateString
        }
    }
}
