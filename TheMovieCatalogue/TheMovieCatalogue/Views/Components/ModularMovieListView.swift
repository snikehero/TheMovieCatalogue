//
//  ModularMovieListView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 27/07/23.
//

import SwiftUI

struct ModularMovieListView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let moviesForFill: [MovieListItem]
    let columns = [
        GridItem(.adaptive(minimum: ModularMovie.gridItemMin))
    ]
    let showBackButtonState: Bool
    var body: some View {
        NavigationStack {
            ScrollView {
                SectionTitle(text: title)
                VStack {
                    LazyVGrid(columns: columns, spacing: ModularMovie.gridSpacing) {
                        ForEach(moviesForFill) { fill in
                            NavigationLink {
                                MovieDetailsView(movieId: fill.id)
                            }
                        label: {
                            AsyncImage(
                                url: URL(string: fill.posterString),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .frame(width: Constants.CarrouselImages.width,
                                   height: Constants.CarrouselImages.height)
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: Constants.CarrouselImages.cornerRadius))
                        }
                        }
                    }
                }
            }
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
        ModularMovieListView(title: "Mock",
                             moviesForFill: MainViewModel.moviesMock, showBackButtonState: true
        )
    }
}
