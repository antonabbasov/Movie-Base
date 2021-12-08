//
//  MovieModel.swift
//  Movie Base
//
//  Created by Anton on 06.12.2021.
//

struct MovieModel: Codable {
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Float
    let popularity: Float
    let id: Int
    let title: String
    let overview: String
}
