//
//  WeatherCitiesView.swift
//  WeatherApp
//
//  Created by gokul on 16/02/24.
//

import SwiftUI

struct WeatherCitiesView: View {
    var articalDict: String?
    var body: some View {
        Text(articalDict ?? "")
    }
}

#Preview {
    WeatherCitiesView()
}
