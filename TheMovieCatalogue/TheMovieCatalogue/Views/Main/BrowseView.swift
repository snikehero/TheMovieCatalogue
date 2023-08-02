//
//  BrowseView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct BrowseView: View {
    @State private var searchTerm: String = ""
    @State private var showingFullScreenCover = false
    @StateObject private var searchViewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(ColorConstant.mainBackgroundColor)
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
                GenreButtons(searchViewModel: searchViewModel)
            }
        }
        .searchable(text: $searchTerm, prompt: StringConstant.promptSearch)
        .onSubmit(of: .search) {
            let cleanSearchTerm = searchTerm.trimmingCharacters(in: .whitespacesAndNewlines)
            if cleanSearchTerm != "" {
                searchViewModel.fetchSearchList(search: cleanSearchTerm)
                showingFullScreenCover.toggle()
            }
        }
        .fullScreenCover(isPresented: $showingFullScreenCover) {
            ModularMovieListView(generalMovieName: searchTerm,
                                 moviesForFill: searchViewModel.searchResults,
                           navigationLinkDestintion: AnyView(EmptyView()))
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
