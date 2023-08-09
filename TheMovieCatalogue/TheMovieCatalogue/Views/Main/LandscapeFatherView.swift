//
//  LandscaoeFather.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 07/08/23.
//

import SwiftUI

struct LandscapeFatherView: View {
    @ObservedObject var mainViewModel : MainViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass!
    var body: some View {
        Group {
            if verticalSizeClass == .compact {
                MainViewLandscape(mainViewModel: mainViewModel)
            } else {
                MainView(mainViewModel: mainViewModel)
            }
        }
    }
}
struct LandscapeFather_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeFatherView(mainViewModel: MainViewModel())
    }
}
