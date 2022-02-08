//
//  KeyValuePair.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 8.02.2022.
//

import Foundation

struct KeyValuePair {
    var id = UUID()
    var key: String
    var value: String
}

extension KeyValuePair: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
