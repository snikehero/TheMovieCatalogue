//
//  ModularMovieListView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 27/07/23.
//

import SwiftUI

struct ModularMovieListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet: Bool = false
    @ObservedObject var mainViewModel = MainViewModel()
    let title: String
    let moviesForFill: [MovieListItem]
    let columns = [
        GridItem(.adaptive(minimum: ModularMovie.gridItemMin))
    ]
    let showBackButtonState: Bool
    @ObservedObject var modularMovieListViewModel : ModularMovieListViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVGrid(columns: columns, spacing: ModularMovie.gridSpacing) {
                        ForEach(modularMovieListViewModel.movies) { fill in
                            NavigationLink {
                                LandscapeFatherDetailsView(movieDetailsViewModel: mainViewModel.movieDetailsViewModel,
                                                           showingSheet: $showingSheet,
                                                           movieId: fill.id)
                            }
                        label: {
                            AsyncImage(
                                url: URL(string: fill.posterString),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                placeholder: {
                                    Text(fill.title)
                                }
                            )
                            .frame(width: Constants.CarrouselImages.width,
                                   height: Constants.CarrouselImages.height)
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: Constants.CarrouselImages.cornerRadius))
                        }
                        }
                        modularMovieListViewModel.loadingStateView
                    }
                }
            }
            .navigationTitle(modularMovieListViewModel.title)
            Spacer()
                .toolbar {
                    if(showBackButtonState) {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: ModularMovie.customBackButtonLabel)
                                Text(StringConstant.browseTitle)
                            }
                        }
                    }
                }
        }
    }
}

struct ModularMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ModularMovieListView(
            showBackButtonState: true,
            modularMovieListViewModel: ModularMovieListViewModel(
                title: StringConstant.nowPlayingTitle,
                withView: .nowPlaying,
                networkManager: NetworkManager(),
                endpointBuilder: EndpointBuilder()
            )
        )
    }
}
