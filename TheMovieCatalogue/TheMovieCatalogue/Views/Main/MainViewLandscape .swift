//
//  MainViewLandscape .swift
//  TheMovieCatalogue
//
//  Created by Ulises Burns on 07/08/23.
//

import SwiftUI

struct MainViewLandscape_: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @ObservedObject var mainViewModel : MainViewModel
    var isLandscape: Bool {
    verticalSizeClass == .compact
    }
    var body: some View {
        NavigationStack {
            HStack {
                LandscapeRecomendedMovie()
                    .padding(.init(top: LandscapeConstant.landscapeRecomendedTopPading,
                                   leading: LandscapeConstant.landscapeRecomendedLeadingPading,
                                   bottom: LandscapeConstant.landscapeRecomendedBottomPading,
                                   trailing: LandscapeConstant.landscapeRecomendedTrailingPading))
                    CarrouselInMainView()
                    .padding(.init(top: LandscapeConstant.landscapeRecomendedLeadingPading,
                                   leading: LandscapeConstant.landscapeCarrouselLeadingPading,
                                   bottom: LandscapeConstant.landscapeCarrouselBottomPading,
                                   trailing: LandscapeConstant.landscapeCarrouselTrailingPading))
                            .environmentObject(mainViewModel)
                            .onAppear {
                                mainViewModel.fetchPopularMovies(withPage: 1)
                                mainViewModel.fetchNowPlaying(withPage: 1)
                        }
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    NavigationLink {
                                        UserView()
                                    } label: {
                                        Image(systemName: "person.fill")
                                    }
                                }
                                ToolbarItem(placement: .navigationBarLeading) {}
                            }
            }
            .environmentObject(mainViewModel)
        }
    }
}
struct MainViewLandscape__Previews: PreviewProvider {
    static var previews: some View {
        MainViewLandscape_(mainViewModel: MainViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
