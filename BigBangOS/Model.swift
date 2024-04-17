//
//  Model.swift
//  BigBangOS
//
//  Created by Yery Castro on 9/12/23.
//

import Foundation

struct BigBang: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let image: String
    let runtime: Int
    let season: Int
    let number: Int
    let summary: String
    
    var episodeInfo: String {
        "\(season.formatted(.number.precision(.integerLength(2))))x\(number.formatted(.number.precision(.integerLength(2))))"
    }
}
