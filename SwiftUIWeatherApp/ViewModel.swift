//
//  ViewModel.swift
//  SwiftUIWeatherApp
//
//  Created by nik.dany on 04.02.2021.
//

import Foundation

private let defaultImage = "cloud.sun"
private let imageMap = [
  "Drizzle" : "cloud.drizzle",
  "Thunderstorm" : "cloud.bolt.rain.fill",
  "Rain": "cloud.heavyrain.fill",
  "Snow": "snow",
  "Clear": "sun.max",
  "Clouds" : "cloud",
]

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var descriptionText: String = ""
    @Published var temperature: String = ""
    @Published var timezone: String = ""
    @Published var imageName: String = defaultImage
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        
        guard let url = URL(string:
            "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&appid=9187423fa8d4ffc730a26f03aea4d70c&units=metric") else {
            return
            
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.name
                    self.temperature = "\(Int(model.main.temp))°"
                    self.descriptionText = model.weather.first?.description ?? "No description"
                    self.timezone = model.weather.first?.main ?? "No description"
                    let image = model.weather.first?.main ?? defaultImage
                    self.imageName = imageMap[image] ?? defaultImage
                    
                }
            }
            catch{
                print("failed")
            }
        }
        task.resume()
    }
}

