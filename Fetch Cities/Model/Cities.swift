//
//  Cities.swift
//  Fetch Cities
//
//  Created by Soumya Mishra on 09/04/25.
//


import Foundation

struct CityResponse: Codable {
    let data: [City]
}

struct City: Codable {
    let cityName: String
    let population: Int
    let economy: Economy

    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case population, economy
    }
}

struct Economy: Codable {
    let majorIndustries: [String]

    enum CodingKeys: String, CodingKey {
        case majorIndustries = "major_industries"
    }
}
