//
//  Model.swift
//  SwiftUIWeatherApp
//
//  Created by nik.dany on 04.02.2021.
//

import Foundation

struct WeatherModel: Decodable {
	let name: String
	let main: Temperature
	
	let weather: [Description]
}

struct Temperature: Decodable {
	let temp: Float
}

struct Description: Decodable {
	let main: String
	let description: String
}
