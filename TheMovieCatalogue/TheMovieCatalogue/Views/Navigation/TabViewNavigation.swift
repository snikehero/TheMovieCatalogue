//
//  TabView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct TabViewNavigation: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor

    var body: some View {
        TabView {
            if networkMonitor.isConnected {
                MainView()
                    .tabItem {
                        Label(TabViewConstants.moviesLabelDescription,
                              systemImage:  TabViewConstants.filmStackMovieIconName)
                    }
                BrowseView()
                    .tabItem {
                        Label(TabViewConstants.browseLabelDescription,
                              systemImage: TabViewConstants.movieSearchIconName)
                    }
            } else {
                NoNetworkView()
            }
        }
        .tabViewStyle(.automatic)
    }
}
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewNavigation().environmentObject(NetworkMonitor.init(isConnected: true))
    }
}
