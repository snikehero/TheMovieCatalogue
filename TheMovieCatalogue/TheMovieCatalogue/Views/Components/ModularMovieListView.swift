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
        GridItem(.adaptive(minimum: 100))
    ]
    let showBackButton: Bool
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(title)
                VStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(moviesForFill) { fill in
                            AsyncImage(
                                url: URL(string: fill.posterString),
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
            Spacer()
                .toolbar {
                    if(showBackButton) {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.backward")
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
                             moviesForFill: MainViewModel.moviesMock, showBackButton: true
                             )
    }
}
