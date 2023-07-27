//
//  BrowseView.swift
//  TheMovieCatalogue
//
//  Created by Moises Lopez on 20/06/23.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(ColorConstant.backgroundColor)
                    .ignoresSafeArea()
                Text("Browse View")
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            NavigationLink {
                                UserView()
                            } label: {
                                Image(systemName: "person.fill")
                            }
                            .navigationTitle("Browse")
                        }
                    }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
