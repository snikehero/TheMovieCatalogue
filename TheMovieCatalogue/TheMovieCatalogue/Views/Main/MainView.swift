//
//  MainView.swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 20/06/23.
//

import SwiftUI


struct MainView: View {
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(Colors.backgroundColor)
                    .ignoresSafeArea()
                ScrollView {
                    RecomendedMovie()

                    CarrouselView(newMovies: mainViewModel.popularMovies?.results ?? [], popularMovies: mainViewModel.popularMovies?.results ?? [])
                        .onAppear{
                            mainViewModel.fetchPopularMovies(withPage: 1)
                        }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing)
                    {
                        NavigationLink {
                            UserView()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                        .navigationTitle(StringConstants.mainTittle)
                    }
                    ToolbarItem(placement: .navigationBarLeading){}
                }
            }
        }
        .environmentObject(mainViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        MainView()
            .preferredColorScheme(.dark)
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
    }
}
