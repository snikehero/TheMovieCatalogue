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
                Color("BackgroundColor")
                    .ignoresSafeArea()
                ScrollView {
                    RecomendedMovie()

                    CarrouselView(newMovies: mainViewModel.nowPlaying?.results ?? [], popularMovies: mainViewModel.popularMovies?.results ?? [])
                        .onAppear{
                            mainViewModel.fetchPopularMovies(withPage: 1)
                            mainViewModel.fetchNowPlaying(withPage: 1)
                        }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing)
                    {
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                        .navigationTitle("Movie")
                    }
                    ToolbarItem(placement: .navigationBarLeading){}
                }
            }
        }
        .environmentObject(mainViewModel)
    }
}

struct PosterButton: View {
    var text: String
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var showingSheet: Bool = false
    
    var body: some View {
        Button(action: { showingSheet.toggle() },
               label: {
            AsyncImage(
                url: URL(string: mainViewModel.randomMovie?.poster ?? "0"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 460)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: 300, height: 460)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        })
        .sheet(isPresented: $showingSheet) {
            MovieDetailsView()
        }
    }
}

struct RecomendedMovie: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recomended Movie")
                    .padding(.horizontal)
                    .font(.system(.title3, design: .rounded))
                Spacer()
            }
            PosterButton(text: "Poster")
                .padding(.bottom)
        }
        .onAppear{
            mainViewModel.fetchTopRated()
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors:[Color("BackgroundColor"), Color("GradientColor")],startPoint: .top, endPoint: .bottom))
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
