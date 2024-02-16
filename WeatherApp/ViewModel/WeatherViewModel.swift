//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by gokul on 16/02/24.
//

import Foundation
class WeatherCitiesViewModel: ObservableObject {
    @Published var citiesModel: CitiesListModel?
    @Published var weatherData: WeatherData?
    
    private let networkManager = NetworkManager()

    func fetchCitiesInCountry(country: String) {
        guard let url = URL(string: CITIES_LIST) else {
            return
        }
        print("resultUrl",url)
        networkManager.fetchData(url: url) { (result: Result<CitiesListModel, Error>) in
            switch result {
            case .success(let citiesModel):
                DispatchQueue.main.async {
                    self.citiesModel = citiesModel
                }
            case .failure(let error):
                print("Error fetching cities: \(error.localizedDescription)")
            }
        }
    }

    func weatherFetchData(city: String) {
        guard let url = URL(string: "https://api.worldweatheronline.com/premium/v1/weather.ashx?q=\(city)&format=json&key=\(API_KEY)") else {
            return
        }

        networkManager.fetchData(url: url) { (result: Result<WeatherData, Error>) in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                }
            case .failure(let error):
                print("Error fetching weather data: \(error.localizedDescription)")
            }
        }
    }
}
