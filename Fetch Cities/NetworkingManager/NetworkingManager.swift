//
//  NetworkingManager.swift
//  Fetch Cities
//
//  Created by Soumya Mishra on 09/04/25.
//

import Foundation
import Combine

class NetworkingManager {
    static let shared = NetworkingManager()
    
    private init() {}
    
    func fetchCities() -> AnyPublisher<[City], Error> {
        let urlString = "\(BASE_URL)/b/9LXA"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { output in
                if let json = try? JSONSerialization.jsonObject(with: output.data, options: .mutableContainers){
                    print("Parse successful")
                    print(json)
                }else{
                    print("Failed to parse")
                }
            })
            .map(\.data)
            .decode(type: CityResponse.self, decoder: JSONDecoder())
            .map{ $0.data }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
