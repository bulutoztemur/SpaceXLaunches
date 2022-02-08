//
//  DateUtil.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 8.02.2022.
//

import Foundation

class DateUtil {
    static func getStringFromDateUnix(dateUnix: TimeInterval, dateFormat: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: dateUnix)
        let formatter = DateFormatter.localizedFormatter(format: dateFormat)
        return formatter.string(from: date)
    }
}

