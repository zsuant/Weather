//
//  WeatherManager.swift
//  Weather
//
//  Created by 이수겸 on 2023/02/13.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("1de8d08936c16764d7d7ed89e8c8426e")&units=metric") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodeData = try JSONDecoder().decode(WeatherData.self, from: data)
        
        return decodeData
    }
    
    
}

