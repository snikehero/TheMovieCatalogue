//
//  HorizontalCarrouselView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/07/23.
//

import SwiftUI

struct HorizontalCarrouselView: View {
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
                            MovieDetailsView(movieId: movie.id)
                        } label: {
                            AsyncImage(
                                url: URL(string: movie.posterString),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: Constants.CarrouselImages.width,
                                               height: Constants.CarrouselImages.height)
                                        .clipShape(RoundedRectangle(cornerRadius:
                                                                        Constants.CarrouselImages.cornerRadius))
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
            .scrollIndicators(.hidden)
        }
    }
}

struct HorizontalCarrouselView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCarrouselView(title: "Carrousel Preview",
                                newMovies: MainViewModel.moviesMock,
                                navigationLinkDestination: AnyView(EmptyView()))
    }
}
