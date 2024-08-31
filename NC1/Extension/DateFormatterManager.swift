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
    
    private let fullDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    private let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func formatFullDate(dateString: String?) -> String {
        guard let dateString = dateString, let date = fullDateFormatter.date(from: dateString) else {
            return ""
        }
        return shortDateFormatter.string(from: date)
    }
    
    func formatSectionHeader(dateString: String) -> String {
        guard let date = shortDateFormatter.date(from: dateString) else {
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
    
    func convertStringToDateAndFormat(string: String, fromFormat: String, toFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        
        guard let date = dateFormatter.date(from: string) else {
            // 문자열을 날짜로 변환하는 데 실패하면 nil 반환
            return nil
        }
        
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}
