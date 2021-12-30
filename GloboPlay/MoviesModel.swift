//
//  Model.swift
//  GloboPlay
//
//  Created by Zanette Ciriaco on 12/12/21.
//

import Foundation

struct Items: Encodable {
    let items: [listData]
}

struct listData: Encodable {
    let media_type: String
    let media_id: Int
}


// MARK: - genre root
struct Genres: Decodable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Decodable{
    let id: Int
    let name: String
}



// movies

struct Movie: Decodable {
    let id: Int
    //let original_title: String
    //let overview: String
    let poster_path: String
    //let release_date: String
    //let title: String
}

struct Root: Decodable {
    let results: [Movie]
}

// MARK: - recommendations
//struct Recommendations: Decodable {
//    //let page: Int
//    let results: [Movie]
//    //let totalPages, totalResults: Int
//}


// MARK: - movie detail
struct MovieDetail: Decodable {
    //let adult: Bool
    //let backdropPath: String
    //let belongsToCollection: NSNull
    //let budget: Int
    let genres: [Genre]
    //let homepage: String
    let id: Int
    //let imdbID,
    //let originalLanguage,
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    //let productionCompanies: [ProductionCompany]
    let production_countries: [ProductionCountry]
    let release_date: String
    //let revenue,
    let runtime: Int
    //let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    //let video: Bool
    //let voteAverage, voteCount: Int
}

struct ProductionCountry: Decodable {
    let name: String
}




//// MARK: - Result
//struct Result {
//    let adult: Bool
//    let backdropPath: NSNull
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage, originalTitle, overview, releaseDate: String
//    let posterPath: NSNull
//    let popularity: Double
//    let title: String
//    let video: Bool
//    let voteAverage, voteCount: Int
//}
