//
//  WeatherDetailView.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import SwiftUI
import MapKit

struct WeatherDetailView: View {
    let weather: Weather
    
    var body: some View {
        Form {
            temperatureView
            descriptionView
            mapView
            pressureView
            humidityView
            windView
        }.navigationBarTitle(weather.name)
    }
}

// MARK: Constituent Views
extension WeatherDetailView {
    private var temperatureView: some View {
        HStack(alignment: .bottom) {
            Text("Temerature")
            Image(systemName: "thermometer")
            Spacer()
            temperatureComponents
        }
    }
    
    private var descriptionView: some View {
        HStack {
            if let description = weather.weatherConditions.first?.description {
                Text(description.capitalized)
            }
            Text(weather.weatherConditions.first?.type.customIcons()  ?? "")
            Spacer()
            Text("\(weather.date.formatted())")
        }
    }
    
    private var mapView: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: weather.coordinates, latitudinalMeters: 1_000, longitudinalMeters: 1_000)), annotationItems: [weather]) {
            MapMarker(coordinate: $0.coordinates)
        }
        .frame(minHeight: 200)
        .cornerRadius(15)
        .padding(.vertical)
    }
    
    private var pressureView: some View {
        returnOptionalMetricCellView(for: "Pressure", imageName: "barometer", weather.weatherMetrics.pressure)
    }
    
    private var humidityView: some View {
        returnOptionalMetricCellView(for: "Humidity", imageName: "humidity", weather.weatherMetrics.humidity)
    }
    
    private var windView: some View {
        HStack {
            returnOptionalMetricCellView(for: "Wind", imageName: "wind", weather.wind.speed)
            Image(systemName: "location.north")
                .rotationEffect(Angle(degrees: weather.wind.direction.converted(to: .degrees).value))
                .foregroundColor(.gray)
        }
    }
}

// MARK: Helper Methods
extension WeatherDetailView {
    @ViewBuilder private var temperatureComponents: some View {
        returnTemperatureMinorComponent(weather.weatherMetrics.tempMin, colour: .blue)
        Text("\(weather.weatherMetrics.temp.metricDisplayRepresentation)")
            .font(.headline)
        returnTemperatureMinorComponent(weather.weatherMetrics.tempMax, colour: .red)
    }
    
    @ViewBuilder private func returnTemperatureMinorComponent(_ value: Double?, colour: Color) -> some View {
        if let value = value {
            Text("\(value.metricDisplayRepresentation)")
                .font(.footnote)
                .foregroundColor(colour)
        }
    }
    
    @ViewBuilder private func returnOptionalMetricForDisplay(_ value: Double?) -> some View {
        if let value = value {
            Text("\(value.metricDisplayRepresentation)")
        }
    }
    
    @ViewBuilder private func returnOptionalMetricCellView(for key: String, imageName: String , _ value: Double?) -> some View {
        if let value = value {
            HStack {
                Text(key)
                Image(systemName: imageName)
                Spacer()
                returnOptionalMetricForDisplay(value)
            }
        }
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherDetailView(weather: .stub)
        }
    }
}
