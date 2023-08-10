//
//  GenreButtons .swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 24/07/23.
//

import SwiftUI

struct GenreButtons: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var isLandscape: Bool {
        verticalSizeClass == .compact
    }
    @ObservedObject var searchViewModel: SearchViewModel
    private let gridColumns = [
        GridItem(.adaptive(minimum: GenresButton.gridMinimum,
                           maximum: GenresButton.gridMaximun),
                 spacing: GenresButton.genreSpacingLandscape)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns,
                          spacing: GenresButton.genreSpacing) {
                    ForEach(searchViewModel.genres) { genre in
                        NavigationLink(destination: MovieListView(genre: genre.name), label: {
                            VStack {
                                Text(genre.name)
                                    .foregroundColor(GenresButton.genreTextColor)
                                    .bold()
                            }
                            .frame(width:  GenresButton.genreWidth,
                                   height: GenresButton.genreHeight)
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
