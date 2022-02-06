//
//  Network.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//


import Foundation
import Apollo

final class Network {
    static let shared = Network()
    private init() {}
    private let apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
    
    func fetch<T: GraphQLQuery>(query: T, successHandler: @escaping (T.Data) -> Void, errorHandler: ((Error) -> Void)?) {
        apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                successHandler(graphQLResult.data!)
            case .failure(let error):
                if let errorHandler = errorHandler {
                    errorHandler(error)
                }
            }
        }
    }
}

