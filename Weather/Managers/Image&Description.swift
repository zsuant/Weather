//
//  File.swift
//  Weather
//
//  Created by 이수겸 on 2023/02/16.
//

import Foundation
import SwiftUI

var image: Image {
    switch weather[0].main {
    case "clear":
        return Image(systemName: "sun.max.fill")
    case "cloudy":
        return Image(systemName: "cloud.fill")
    case "mostlyClear", "partlyCloudy", "mostlyCloudy":
        return Image(systemName: "cloud.sun.fill")
    case "fog", "lightFog":
        return Image(systemName: "cloud.fog.fill")
    case "lightWind", "wind":
        return Image(systemName: "wind")
    case "strongWind":
        return Image(systemName: "tornado")
    case "drizzle":
        return Image(systemName: "cloud.drizzle.fill")
    case "lightRain", "rain":
        return Image(systemName: "cloud.rain.fill")
    case "heavyRain":
        return Image(systemName: "cloud.heavyrain.fill")
    case "snow", "flurries", "lightSnow", "heavySnow":
        return Image(systemName: "snow")
    case "freezingDrizzle":
        return Image(systemName: "thermometer.snowflake")
    case "freezingRain", "lightFreezingRain", "heavyFreezingRain":
        return Image(systemName: "cloud.rain.fill")
    case "icePellets", "heavyIcePellets", "lightIcePellets":
        return Image(systemName: "cloud.hail.fill")
    case "thunderstorm":
        return Image(systemName: "cloud.bolt.fill")
    default:
        return Image(systemName: "blank")
    }
}
