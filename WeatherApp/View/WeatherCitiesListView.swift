//
//  ContentView.swift
//  WeatherApp
//
//  Created by gokul on 16/02/24.
//

import SwiftUI

struct WeatherCitiesListView: View {
    @StateObject var viewModel = WeatherCitiesViewModel()
    @State private var searchText = ""
    var filteredCities: [String] {
        if searchText.isEmpty {
            return viewModel.citiesModel?.data ?? []
        } else {
            return viewModel.citiesModel?.data.filter { $0.lowercased().contains(searchText.lowercased()) } ?? []
        }
    }
    var body: some View {
        NavigationView {
            List(filteredCities, id: \.self) { city in
                NavigationLink(destination: WeatherDetailsView(articleLists: city)) {
                    WeatherCitiesView(articalDict: city)
                }
            }
            .navigationTitle("Weather Cities")
        }
        .onAppear {
            viewModel.fetchCitiesInCountry(country: "India")
        }
        .searchable(text: $searchText) {
            // You can customize the search suggestions here if needed
        }
    }
}

#Preview {
    WeatherCitiesListView()
}
