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
                LandscapeMainView(mainViewModel: mainViewModel)
            } else {
                MainView(mainViewModel: mainViewModel)
            }
        }
    }
}

struct LandscapeFatherDetailsView: View {
    @ObservedObject var movieDetailsViewModel: MovieDetailsViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass!
    @Binding var showingSheet: Bool
    var movieId: Int
    var body: some View {
        Group {
            if verticalSizeClass == .compact {
               LandscapeMovieDetailsView(showingSheet: $showingSheet,
                                         movieDetailsViewModel: movieDetailsViewModel,
                                         movieId: movieId)
            } else {
                MovieDetailsView(showingSheet: $showingSheet,
                                 movieDetailsViewModel: movieDetailsViewModel,
                                 movieId: movieId)
            }
        }
    }
}

struct LandscapeFather_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeFatherView(mainViewModel: MainViewModel())
    }
}
