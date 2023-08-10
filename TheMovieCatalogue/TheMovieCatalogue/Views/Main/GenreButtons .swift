//
//  GenreButtons .swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 24/07/23.
//

import SwiftUI

struct GenreButtons: View {
    @ObservedObject var searchViewModel: SearchViewModel

    private let gridColumns = [
        GridItem(.flexible(), spacing: GenresButton.genreSpacing),
        GridItem(.flexible(), spacing: GenresButton.genreSpacing)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: GenresButton.genreSpacing) {
                    ForEach(searchViewModel.genres) { genre in
                        NavigationLink(destination: ModularMovieListView(title: genre.name,
                                                                         moviesForFill: searchViewModel.byGenre,
                                                                         showBackButtonState: false)
                            .onAppear {
                                searchViewModel.fetchByGenre(genre: String(genre.id), page: 1)
                        }, label: {
                                VStack {
                                    Text(genre.name)
                                        .foregroundColor(GenresButton.genreTextColor)
                                        .bold()
                                }
                                .frame(width: GenresButton.genreWidth, height: GenresButton.genreHeight)
                                .background(GenresButton.genreButtonColor)
                                .clipShape(Rectangle())
                                .cornerRadius(GenresButton.genreCorner)
                            }
                      )
                    }
                }.padding()
            }
            .onAppear {
                searchViewModel.fetchGenres()
            }
        }
    }
}

struct MovieListView: View {
    let genre: String

    var body: some View {
        VStack {
            Text("\(genre) Movies")
                .font(.title)
                .padding()
        }
        .navigationTitle(genre)
    }
}

struct GenreButtonsPreviews: PreviewProvider {
    static var previews: some View {
        GenreButtons(searchViewModel: SearchViewModel.init())
    }
}
