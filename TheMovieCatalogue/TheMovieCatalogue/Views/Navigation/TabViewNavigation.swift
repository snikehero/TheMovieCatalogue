//
//  TabView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct TabViewNavigation: View {
  var body: some View {
    TabView {
      MainView()
        .tabItem {
          Label("Movies",systemImage: "film.stack")
        }

      BrowseView()
        .tabItem {
          Label("Browse",systemImage: "magnifyingglass")
        }
    }
    .tabViewStyle(.automatic)
  }
}
struct TabView_Previews: PreviewProvider {
  static var previews: some View {
    TabViewNavigation()
  }
}
