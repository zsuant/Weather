//
//  WeatherView.swift
//  Weather
//
//  Created by 이수겸 on 2023/02/15.
//

import SwiftUI
import _CoreLocationUI_SwiftUI


struct WeatherView: View {
    var weather: WeatherData
    @EnvironmentObject var locationManager: LocationManager

    
    var body: some View {
        ZStack(alignment: .leading) {
            backgroundView()

            VStack {
                HStack {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Spacer()
                
                VStack {
                    


                    Text(weather.main.feelsLike.roundDouble() + "°")
                        .font(.system(size: 80))
                        .padding()
                    
                    Text(weather.weather[0].main)
                        .font(.system(size:18))
                        .padding()
                        
                    
                    HStack(spacing: 20) {
                        Text("최고  " + weather.main.temp_max.roundDouble() + "°")
                            .font(.system(size: 20))
                        Text("최저  " + weather.main.temp_min.roundDouble() + "°")
                            .font(.system(size: 20))
                    }
                  //  Spacer()
                    
                   
           //         weather.weatherCode.image

                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .preferredColorScheme(.dark)
    }
    
    func backGroundImage() -> String {
        guard let weather = weather else {
            return "nosign"
        }
        switch weather.weather.first?.icon {
        case "01d":
          //  isBlack = true
            return "Sun"
        case "01n":
            return "Moon"
        case "02d", "02n", "03d", "03n", "04d", "04n":
            return "Cloud"
        case "09d", "09n", "10d", "10n":
            return "Rain"
        case "11d", "11n":
            return "Thunder"
        case "13d", "13n":
            return "Snow"
        case "50d", "50n":
            return "Fog"
        default:
            return "nosign"
        }
    }

    @ViewBuilder
    func backgroundView() -> some View {
        let backgroundImage: String = backGroundImage()
        GeometryReader { geometry in
            Image("\(backgroundImage)")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

        }
        .ignoresSafeArea()
    }
    

}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
