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
                    .frame(width: ButtonsConstant.posterButtonWidth,
                           height: LandscapeConstant.landscapeDetailsFrameHeigh)
                    .clipShape(RoundedRectangle(cornerRadius: ButtonsConstant.buttonsCornerRadius))
                VStack {
                    MovieTitle(text: movieDetailsViewModel.movie.title)
                MovieSpecs(
                    genre: movieDetailsViewModel.movie.genres[0].name,
                    releaseDate: movieDetailsViewModel.movie.releaseDate,
                    runtime: movieDetailsViewModel.movie.runtime)
                    MovieSynopsis(text: movieDetailsViewModel.movie.overview)
                    FavoritesButton()
                        .padding(.init(top: LandscapeConstant.landscapeDetailsTopPadding,
                                       leading: LandscapeConstant.landscapeCarrouselTopPading,
                                       bottom: LandscapeConstant.landscapeCarrouselTopPading,
                                       trailing: LandscapeConstant.landscapeCarrouselTopPading))
                    }
                .padding(.init(top: LandscapeConstant.landscapeDetailsVStackTopPadding,
                               leading: LandscapeConstant.landscapeDetailsVStackleadingPadding,
                               bottom: LandscapeConstant.landscapeDetailsVStackBottomPadding,
                               trailing: LandscapeConstant.landscapeDetailsVStackTrailingPadding))
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
