//
//  TabView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct TabViewNavigation: View {
  var body: some View {
    //MARK: TabView
    TabView{
      MainView() //Change to OriginalMainView
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


