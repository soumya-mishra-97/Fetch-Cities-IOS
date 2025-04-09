//
//  ViewModel.swift
//  Fetch Cities
//
//  Created by Soumya Mishra on 09/04/25.
//

import Foundation
import Combine

class CityViewModel {
    
    @Published var cities: [City] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchCityData() {
        NetworkingManager.shared.fetchCities()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] cities in
                self?.cities = cities
            }).store(in: &cancellables)
    }
}

