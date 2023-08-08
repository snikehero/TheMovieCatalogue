//
//  MainView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 20/06/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel: MainViewModel
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(ColorConstant.mainBackgroundColor)
                    .ignoresSafeArea()
                ScrollView {
                    RecomendedMovie()
                    CarrouselInMainView()
                        .environmentObject(mainViewModel)
                        .onAppear {
                            mainViewModel.fetchPopularMovies(withPage: 1)
                            mainViewModel.fetchNowPlaying(withPage: 1)
                        }
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            UserView()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                        .navigationTitle(StringConstant.mainTittle)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {}
                }
            }
        }
        .environmentObject(mainViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
    }
}
