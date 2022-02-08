//
//  DateFormatter+Extension.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 8.02.2022.
//

import Foundation

public extension DateFormatter {
    static func localizedFormatter(format: DateFormat) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = NSLocale.current
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        return formatter
    }
}
