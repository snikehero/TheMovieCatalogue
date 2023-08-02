//
//  CarrouselView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 06/07/23.
//

import SwiftUI

struct CarrouselInMainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.General.spacing) {
                    HorizontalCarrouselView(title: "Now Playing",
                                            newMovies: viewModel.nowPlaying,
                                            navigationLinkDestination:
                                                AnyView(ModularMovieListView(title: "Now Playing",
                                                                             moviesForFill: viewModel.nowPlaying,
                                                                             showBackButtonState: false))
                    )
                    HorizontalCarrouselView(title: "Popular Movies",
                                            newMovies: viewModel.popularMovies,
                                            navigationLinkDestination:
                                                AnyView(ModularMovieListView(title: "Popular Movies",
                                                                             moviesForFill: viewModel.popularMovies,
                                                                             showBackButtonState: false))
                    )
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct CarrouselView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewModel = MainViewModel()
        CarrouselInMainView()
            .environmentObject(mainViewModel)
            .onAppear {
                mainViewModel.fetchPopularMovies(withPage: 1)
                mainViewModel.fetchNowPlaying(withPage: 1)
            }
    }
}
