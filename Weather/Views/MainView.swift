//
//  MainView.swift
//  Weather
//
//  Created by 이수겸 on 2023/02/13.
//

import SwiftUI

struct MainView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherData?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingVIew()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            } catch {
                                print("Error getting weather\(error)")
                            }
                        }
                    
                }
            } else {
                if locationManager.isLoading {
                    LoadingVIew()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)

                }
            }

        }
        

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
