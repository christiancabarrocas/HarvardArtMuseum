//
//  Model.swift
//  HarvardMuseum
//
//  Created by Christian Cabarrocas on 29/10/2020.
//

import Foundation
struct ResponseInfo: Codable {
    let totalrecordsperquery: Int
    let totalrecords: Int
    let pages: Int
    let page: Int
}

struct AuthorResponse: Codable {
    let info: ResponseInfo
    let records: [Author]
}

extension AuthorResponse: Identifiable {
    var id: UUID { return UUID() }
}

struct Author: Codable {
    let alphasort: String!
    let birthplace: String!
    let deathplace: String!
    let name: String!
    let displayname: String!
    let culture: String!
    let displaydate: String!
}

extension Author: Identifiable {
    var id: UUID { return UUID() }
}

struct PieceSummary: Codable {
    let technique: String!
    let totalpageviews: Int
    let objectnumber: String
    let description: String!
    let primaryimageurl: String!
    let dated: String!
    let period: String!
    let url: String!
}

struct PieceColor: Codable {
    let percent: Double
    let spectrum: String
    let color: String
    let hue: String
}

struct PieceImage: Codable {
    let date: String
    let copyright: String
    let format: String
    let description: String!
    let technique: String!
    let baseimageurl: String!
    let iiifbaseuri: String!
    let width: Int
    let height: Int
}

struct Piece: Codable {
    let objectid: Int
    let title: String
    let accessionyear: Int
    let dated: String
    let classification: String
    let classificationid: Int
    let medium: String
    let technique: String
    let period: String
    let periodid: Int
    let century: String
    let culture: String
    let style: String!
    let state: String!
    let dimensions: String!
    let department: String
    let division: String
    let provenance: String!
    let imagecount: Int!
    let publicationcount: Int!
    let exhibitioncount: Int!
    let totalpageviews: Int!
    let verificationlevel: Int!
    let verificationleveldescription: String!
    let accessionmethod: String!
    let url: String!
    let colors: [PieceColor]
    let contextualtext: [String]
    let exhibitions: [Exhibition]
    let gallery: Gallery
    let images: [PieceImage]
    let publications: [Publication]
    let worktypes: [WorkType]
}

struct Exhibition: Codable {
    let citation: String
    let title: String
    let exhibitionid: Int
    let begindate: String!
    let enddate: String!
}

struct Gallery: Codable {
    let gallerynumber: String
    let floor: Int
    let theme: String
    let name: String
    let galleryid: Int
    let begindate: String
}

struct Publication: Codable {
    let citation: String!
    let title: String!
    let publicationplace: String!
    let publicationyear: Int!
    let pagenumbers: String!
}

struct WorkType: Codable {
    let worktypeid: String
    let worktype: String
}
