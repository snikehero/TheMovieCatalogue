//
//  BrowseView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct BrowseView: View {
    @State private var searchTerm = ""
    @State private var showingFullScreenCover = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(ColorConstant.backgroundColor)
                    .ignoresSafeArea()
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            NavigationLink {
                                UserView()
                            } label: {
                                Image(systemName: "person.fill")
                            }
                            .navigationTitle(StringConstant.browseTitle)
                        }
                    }
            }
        }
        .searchable(text: $searchTerm, prompt: StringConstant.promptSearch)
        .onSubmit(of: .search) {
            showingFullScreenCover.toggle()
        }
        .fullScreenCover(isPresented: $showingFullScreenCover) {
            ModularMovieListView(generalMovieName: searchTerm,
                           moviesForFill: MainViewModel.moviesMock,
                           navigationLinkDestintion: AnyView(EmptyView()))
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
