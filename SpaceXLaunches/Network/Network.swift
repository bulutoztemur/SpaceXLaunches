//
//  Network.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//


import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
}

