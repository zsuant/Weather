//
//  WelcomeView.swift
//  Weather
//
//  Created by 이수겸 on 2023/02/13.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {

            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .labelStyle(.iconOnly)
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
