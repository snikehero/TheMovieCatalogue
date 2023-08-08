//
//  LandscaoeFather.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 07/08/23.
//

import SwiftUI

struct LandscapeFather: View {
    @ObservedObject var mainViewModel : MainViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass!
    var body: some View {
        Group {
            if verticalSizeClass == .compact {
                MainViewLandscape_(mainViewModel: mainViewModel)
            } else {
                MainView(mainViewModel: mainViewModel)
            }
        }
    }
}
struct LandscapeFather_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeFather(mainViewModel: MainViewModel())
    }
}
