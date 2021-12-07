//
//  NowPlayingModel.swift
//  Movie Base
//
//  Created by Anton on 06.12.2021.
//

final class NowPlayingModel: Decodable {
    let page: Int
    let results: [MovieModel]
    let totalPages: Int
    let totalResults: Int
}
