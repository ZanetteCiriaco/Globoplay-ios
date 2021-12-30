//
//  MyListModel.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 29/12/21.
//

import Foundation

// MARK: - Welcome
struct Mylist: Decodable{
    //let averageRating: Double
    //let backdropPath: NSNull
    //let comments: [String: String?]
    //let createdBy: CreatedBy
    //let welcomeDescription: String
    let id: Int
    //let iso3166_1, iso639_1, name: String
    //let objectIDS: [String: String?]
    //let page: Int
    //let posterPath: NSNull
    //let welcomePublic: Bool
    let results: [ListMovie]
    //let revenue, runtime: Int
    //let sortBy: String
    //let totalPages, totalResults: Int
}

// MARK: - CreatedBy
struct CreatedBy {
    let gravatarHash, id, name, username: String
}


// MARK: - Result
struct ListMovie: Decodable {
//    let adult: Bool?
//    let backdropPath: String
//    let genreIDS: [Int]
      let id: Int
//    let mediaType, originalLanguage: String
//    let originalTitle: String?
//    let overview: String
//    let popularity: Double
      let poster_path: String
//    let releaseDate, title: String?
//    let video: Bool?
//    let voteAverage: Double
//    let voteCount: Int
//    let firstAirDate, name: String?
//    let originCountry: [String]?
//    let originalName: String?
}
