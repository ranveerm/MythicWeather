//
//  WeatherListView.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 9/4/2022.
//

import SwiftUI

struct WeatherListView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                progressView
                notificationView
                weatherListView
            }
            .navigationBarTitle("☀️ Mythic Weather ⛈")
        }
    }
}

// MARK: Constituent Views
extension WeatherListView {
    var weatherListView: some View {
        ForEach(viewModel.retrievedWeather) { weather in
            NavigationLink(destination: WeatherDetailView(weather: weather)) {
                WeatherCellView(weather: weather)
            }
        }
    }
    
    @ViewBuilder var notificationView: some View {
        if viewModel.state == .noWeatherDataToDispaly {
            Text("No weather items to display at the moment, pull to refresh.")
        } else if viewModel.state == .networkError {
            Text("⚠️ There was a netork error. Try again later or pull ot refresh.")
        }
    }
    
    @ViewBuilder var progressView: some View {
        if viewModel.state == .retrievingWeatherData {
            ProgressView("Retrieving weather data...")
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

// MARK: ViewModel
extension WeatherListView {
    class ViewModel: ObservableObject {
        @Published private(set) var retrievedWeather: [Weather] = []
        private(set) var state: State = .retrievingWeatherData
        /// The below variable can be moved into `Constants` in the future.
        private let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        enum State {
            case retrievingWeatherData
            case networkError
            case noWeatherDataToDispaly
            case displayWeatherData
        }
    }
}

struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
