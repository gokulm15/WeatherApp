//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by gokul on 16/02/24.
//

import SwiftUI

struct WeatherDetailsView: View {
    var articleLists: String?
    @StateObject private var viewModel = WeatherCitiesViewModel()
    @State private var imageData: Data?
    
    var body: some View {
        ZStack {
            // Background Image
            Image("sky_img")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0) {
                Text(viewModel.weatherData?.data.request.first?.query ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 45)
                Text("\(viewModel.weatherData?.data.currentCondition.first?.tempC ?? "")°C")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(height: 55)
                Text(viewModel.weatherData?.data.currentCondition.first?.weatherDesc.first?.value ?? "")
                    .padding()
                    .foregroundColor(.white)
                    .font(.title3)
                    .frame(height: 35)
                Text("Today \(viewModel.weatherData?.data.currentCondition.first?.observationTime ?? "")")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 35)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.weatherData?.data.climateAverages[0].month ?? []) { dict in
                            
                            WeatherCardView(
                                name: dict.name,
                                symbolName: "cloud.moon",
                                avgMinTemp: dict.avgMinTemp,
                                absMaxTemp: dict.absMaxTemp
                            )
                            
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .onAppear {
                viewModel.weatherFetchData(city: articleLists ?? "")
            }
            
            
        }
        
        
    }
}

#Preview {
    WeatherDetailsView()
}

