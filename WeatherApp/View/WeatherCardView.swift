//
//  WeatherCardView.swift
//  WeatherApp
//
//  Created by gokul on 16/02/24.
//

import Foundation
import UIKit
import SwiftUI
struct WeatherCardView: View {
    let name: String
    let symbolName: String
    let avgMinTemp: String
    let absMaxTemp: String

    var body: some View {
        VStack {
            Text(name)
                .font(.title3)
                .foregroundColor(.white)
                .padding()
                .frame(height: 30)

            Image(systemName: symbolName)
                .frame(width: 35, height: 35, alignment: .center)
                .foregroundColor(.white)

            Text("L:\(avgMinTemp)")
                .font(.title3)
                .foregroundColor(.white)
                .padding()
                .frame(height: 30)
            let doubleValue = Double(absMaxTemp)
            let formattedString = String(format: "%.2f", doubleValue ?? 0.0)
            Text("H:\(formattedString)")
                .font(.title3)
                .foregroundColor(.white)
                .padding()
                .frame(height: 30)
        }
        .background(Color.white.opacity(0.2)) // Add a background color to make it look like a card
        .cornerRadius(10) // Add corner radius for a card-like appearance
        .padding()
    }
}
