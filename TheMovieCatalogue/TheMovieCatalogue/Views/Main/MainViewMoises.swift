//
//  MainViewMoises.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct MainViewMoises: View {
  var body: some View {
    NavigationStack {
      ZStack {
        Color.red
        Text("MainView")
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing)
            {
              NavigationLink {
                UserView()
              } label: {
                Image(systemName: "person")
              }
              .navigationTitle("Movies")
            }
          }
      }
    }
  }
}

struct MainViewMoises_Previews: PreviewProvider {
  static var previews: some View {
    MainViewMoises()
  }
}
