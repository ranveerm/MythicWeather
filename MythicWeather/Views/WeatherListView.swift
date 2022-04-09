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
            case unknownError
        }
        
        func setWeatherData(from urlString: String) async {
            self.state = .retrievingWeatherData
            self.retrievedWeather = await fetchWeatherData(from: urlString)
        }
        
        private func fetchWeatherData(from urlString: String) async -> [Weather] {
            guard let url = URL(string: urlString) else {
                self.state = .unknownError
                return []
            }
            
            let (state, data) = await makeWeatherDataNetworkRequest(from: url)
            
            guard let data = data else {
                self.state = state
                return []
            }
            
            guard let weatherData = try? decoder.decode(WeatherAPIResponse.self, from: data) else {
                self.state = .unknownError
                return []
            }
            
            self.state = .displayWeatherData
            return weatherData.weatherItems
        }
        
        private func makeWeatherDataNetworkRequest(from url: URL) async -> (State, Data?) {
            self.state = .retrievingWeatherData
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          return(.networkError, nil)
                      }
                return (.retrievingWeatherData, data)
            } catch {
                return(.networkError, nil)
            }
        }
    }
}

struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
