//
//  GenreButtons .swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 24/07/23.
//

import SwiftUI

struct GenreButtons: View {
   private let movieGenres = ["Acción", "Comedia", "Drama", "Ciencia Ficción", "Aventura", "Thriller"]
    private let gridColumns = [GridItem(.flexible(), spacing: GenresButton.genreSpacing), GridItem(.flexible(), spacing: GenresButton.genreSpacing)]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: GenresButton.genreSpacing) {
                    ForEach(movieGenres, id: \.self) { genre in
                        ZStack {
                            NavigationLink(destination: MovieListView(genre: genre), label: {
                                VStack {
                                    Text(genre)
                                        .foregroundColor(Color(GenresButton.textColor))
                                        .bold()
                                }
                                .frame(width: GenresButton.genreWidth, height: GenresButton.genreHeight)
                                .background(Color(GenresButton.buttonColor))
                                .clipShape(Rectangle())
                                .cornerRadius(GenresButton.genreCorner)
                            }
                      )}
                    }
                }.padding()
            }
        }
    }
}

struct MovieListView: View {
    let genre: String
    var body: some View {
        VStack {
            Text("Películas de \(genre)")
                .font(.title)
                .padding()
        }
        .navigationTitle(genre)
    }
}

struct GenreButtonsPreviews: PreviewProvider {
    static var previews: some View {
        GenreButtons()
    }
}
