//
//  TabView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject var mainViewModel = MainViewModel()
    @ObservedObject var movieDetailsViewModel = MovieDetailsViewModel()
    var body: some View {
        TabView {
            if networkMonitor.isConnected {
                LandscapeFatherView(mainViewModel: mainViewModel)
                    .tabItem {
                        Label(TabViewConstants.moviesLabelDescription,
                              systemImage:  TabViewConstants.filmStackMovieIconName)
                    }
                BrowseView()
                    .tabItem {
                        Label(TabViewConstants.browseLabelDescription,
                              systemImage: TabViewConstants.movieSearchIconName)
                    }
            } else {
                NoNetworkView()
            }
        }
        .sheet(isPresented: $mainViewModel.showingSheet) {
            LandscapeFatherDetailsView(movieDetailsViewModel: movieDetailsViewModel,
                                       showingSheet: $mainViewModel.showingSheet,
                                       movieId: mainViewModel.randomMovie?.id ?? 0)
        }
        .tabViewStyle(.automatic)
    }
}
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView().environmentObject(NetworkMonitor.init(isConnected: true))
    }
}
