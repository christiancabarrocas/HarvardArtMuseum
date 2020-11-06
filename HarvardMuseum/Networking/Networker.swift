//
//  Networker.swift
//  HarvardMuseum
//
//  Created by Christian Cabarrocas on 29/10/2020.
//

import Foundation
import Combine
import Alamofire

enum CommError: Error {
    case unknown
    case connection
    case url
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]!
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = Configuration.httpMethod
        components.host = Configuration.host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

enum QueryType: String {
    case apikey
    case size
    case page
    case sort
    case sortorder
}

struct QueryItem {
    let type: QueryType
    let value: String

    var apiKeyQuery: URLQueryItem { return URLQueryItem(name: QueryType.apikey.rawValue, value: Configuration.apikey)}
    var ascending: String { return "asc" }
    var descending: String { return "desc" }

    var object: URLQueryItem { return URLQueryItem(name: type.rawValue, value: value) }
}

struct Configuration {
    static let httpMethod = "https"
    static let host = "api.harvardartmuseums.org"
    static let apikey = "acd5edb2-0161-48e7-80bb-9d161e548f8c"
}


enum Entity: String {
    case object
    case person
    case exhibition
    case publication
    case gallery
    case century
    case classification
    case color
    case culture
    case period
    case worktype
    case technique

    var value: String { return "/\(self.rawValue)" }
}


final class Networker {

    func getEntity(_ entity: Entity, queryItems: [QueryItem] = []) -> AnyPublisher<Data, Error> {

        var qItems = [QueryItem(type: .apikey, value: Configuration.apikey)]
        qItems.append(contentsOf: queryItems)
        let queries = qItems.map { $0.object }

        let endpoint = Endpoint(path: entity.value, queryItems:queries)

        return load(endpoint: endpoint)
            .catch { error in
                Fail(error: error)
            }
            .eraseToAnyPublisher()
    }

    private func load(endpoint: Endpoint) -> Future<Data, Error> {

        let session = URLSession.shared

        return Future { promise in

            guard let url = endpoint.url else { promise(.failure(CommError.url)); return }

            let task = session.dataTask(with: url) { (serverData, response, error) in
                if let err = error { promise(.failure(err)) }
                else {
                    if let data = serverData { promise(.success(data)) }
                    else { }
                }
            }
            task.resume()
        }
    }
}
