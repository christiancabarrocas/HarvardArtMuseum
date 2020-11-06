//
//  Dataprovider.swift
//  HarvardMuseum
//
//  Created by Christian Cabarrocas on 29/10/2020.
//

import Foundation
import Combine
import Console
import Alamofire

final class Dataprovider: ObservableObject {

    private let networker = Networker()
    @Published var authors: [AuthorViewModel] = []

    var cancellable: AnyCancellable?

    func loadAuthors() {
        let queryItems = [QueryItem(type: .size, value: "25"),
                          QueryItem(type: .sort, value: "random")]

        cancellable = networker.getEntity(.person, queryItems: queryItems)
            .decode(type: AuthorResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    Console.log(type: .error, subtype: .networking)
                }
            }, receiveValue: { data in
                self.authors = data.records.map { AuthorViewModel(author: $0) }
            })
    }
}
