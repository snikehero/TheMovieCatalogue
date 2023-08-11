//
//  LandscapeMovieDetailsView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 09/08/23.
//

import SwiftUI

struct LandscapeMovieDetailsView: View {
    @Binding var showingSheet: Bool
    @ObservedObject var movieDetailsViewModel: MovieDetailsViewModel
    var movieId: Int
    var body: some View {
        ZStack {
            HStack {
                MovieImage(imageURL:  movieDetailsViewModel.movie.backdropString)
                    .frame(width: ButtonsConstant.posterButtonWidth, height: 320)
                    .clipShape(RoundedRectangle(cornerRadius: ButtonsConstant.buttonsCornerRadius))
                VStack {
                    MovieTitle(text: movieDetailsViewModel.movie.title)
                MovieSpecs(
                    genre: movieDetailsViewModel.movie.genres[0].name,
                    releaseDate: movieDetailsViewModel.movie.releaseDate,
                    runtime: movieDetailsViewModel.movie.runtime)
                    MovieSynopsis(text: movieDetailsViewModel.movie.overview)
                    FavoritesButton()
                        .padding(.init(top: 20, leading: 1, bottom: 1, trailing: 1))
                    }
                .padding(.init(top: 50, leading: 10, bottom: 100, trailing: 40))
            }
            .environmentObject(movieDetailsViewModel)
        }
        .onAppear {
            movieDetailsViewModel.fetchMovie(withId: movieId)
        }
    }
}

struct LandscapeMovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeMovieDetailsView(showingSheet: .constant(false),
                                  movieDetailsViewModel: MovieDetailsViewModel(),
                                  movieId: 20)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
