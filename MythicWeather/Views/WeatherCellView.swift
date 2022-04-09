//
//  WeatherCellView.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 9/4/2022.
//

import SwiftUI

struct WeatherCellView: View {
    let weather: Weather
    
    var body: some View {
        VStack {
            titleView
            captionView
        }
    }
}

// MARK: Constituent Views
extension WeatherCellView {
    var titleView: some View {
        HStack {
            Text(weather.name)
            Spacer()
            Text(weather.weatherConditions.first?.type.customIcons() ?? "")
        }
        .font(.title)
    }
    
    var captionView: some View{
        HStack(spacing: 30) {
            returnOptionalMetricForDisplay(weather.weatherMetrics.temp, imageName: "thermometer")
            returnOptionalMetricForDisplay(weather.weatherMetrics.humidity, imageName: "humidity")
            returnOptionalMetricForDisplay(weather.weatherMetrics.pressure, imageName: "barometer")
            Spacer()
        }
        .foregroundColor(.gray)
        .font(.footnote)
    }
}

// MARK: Helper Methods
extension WeatherCellView {
    @ViewBuilder private func returnOptionalMetricForDisplay(_ value: Double?, imageName: String) -> some View {
        if let value = value {
            HStack {
                Image(systemName: imageName)
                Text("\(value.metricDisplayRepresentation)")
            }
        }
    }
}

struct WeatherCellView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                WeatherCellView(weather: .stub)
            }
        }
    }
}
