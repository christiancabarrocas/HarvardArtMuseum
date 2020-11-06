//
//  AuthorViewModel.swift
//  HarvardMuseum
//
//  Created by Shootr on 05/11/2020.
//

import Foundation

private enum DefaultValues: String {
    case empty = ""
    case artistName = "Artist"
    case culture = "Unkown culture"
    var value: String {
        return self.rawValue
    }
}

struct AuthorViewModel {

    let author: Author

    init(author: Author) {
        self.author = author
    }

    var birthplace: String {
        return author.birthplace ?? DefaultValues.empty.value
    }

    var deathplace: String {
        return author.deathplace ?? DefaultValues.empty.value
    }

    var displayname: String {
        return author.displayname ?? DefaultValues.artistName.value
    }

    var culture: String {
        return author.culture ?? DefaultValues.culture.value
    }

    var displaydate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: author.displaydate)!

        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}


extension AuthorViewModel: Identifiable {
    var id: UUID { return UUID() }
}
