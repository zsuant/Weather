//
//  LoadingVIew.swift
//  Weather
//
//  Created by 이수겸 on 2023/02/13.
//

import SwiftUI

struct LoadingVIew: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct LoadingVIew_Previews: PreviewProvider {
    static var previews: some View {
        LoadingVIew()
    }
}
