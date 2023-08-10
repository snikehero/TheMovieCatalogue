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
                    HorizontalCarrouselView(title: StringConstant.nowPlayingTitle,
                                            newMovies: viewModel.nowPlaying,
                                            navigationLinkDestination:
                                                AnyView(
                                                    ModularMovieListView(
                                                        showBackButtonState: false,
                                                        modularMovieListViewModel: ModularMovieListViewModel(
                                                            title: StringConstant.nowPlayingTitle, withView: .nowPlaying
                                                        )
                                                    )
                                                )
                    )
                    HorizontalCarrouselView(title: StringConstant.popularTitle,
                                            newMovies: viewModel.popularMovies,
                                            navigationLinkDestination:
                                                AnyView(
                                                    ModularMovieListView(
                                                        showBackButtonState: false,
                                                        modularMovieListViewModel: ModularMovieListViewModel(
                                                            title: StringConstant.popularTitle, withView: .popular
                                                        )
                                                    )
                                                )
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
