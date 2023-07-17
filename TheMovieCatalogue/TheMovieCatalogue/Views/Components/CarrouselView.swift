//
//  CarrouselView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 06/07/23.
//

import SwiftUI

struct CarrouselView: View {
    let newMovies: [MovieListItem]
    let popularMovies: [MovieListItem]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: Constants.General.spacing) {
                    HorizontalCarrouselView(title: "Now Playing",
                                            newMovies: newMovies,
                                            navigationLinkDestination: AnyView(NewMoviesView())
                    )
                    HorizontalCarrouselView(title: "Popular Movies",
                                            newMovies: popularMovies,
                                            navigationLinkDestination: AnyView(PopularMoviesView())
                    )
                    Spacer()
                }
                .padding()
            }
        }
    }
}

private struct HorizontalCarrouselView: View {
    let title: String
    let newMovies: [MovieListItem]
    let navigationLinkDestination: AnyView
    
    var body: some View {
        VStack(alignment: .leading,spacing: Constants.CarrouselImages.spacing) {
            NavigationLink {
                navigationLinkDestination
            } label: {
                Text(title)
                    .font(.system(.title2, design: .rounded))
                    .accentColor(.primary)
            }
            ScrollView(.horizontal) {
                HStack(spacing: Constants.CarrouselImages.spacing) {
                    ForEach(newMovies.prefix(10)) { movie in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            AsyncImage(
                                url: URL(string: movie.poster ?? ""),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: Constants.CarrouselImages.width, height: Constants.CarrouselImages.height)
                                        .clipShape(RoundedRectangle(cornerRadius: Constants.CarrouselImages.cornerRadius))
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
    }
}

struct CarrouselView_Previews: PreviewProvider {
  static var previews: some View {
      CarrouselView(newMovies: [MovieListItem.mock, MovieListItem.mock], popularMovies: [MovieListItem.mock, MovieListItem.mock])
  }
}
