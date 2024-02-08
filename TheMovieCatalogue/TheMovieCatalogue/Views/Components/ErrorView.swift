//
//  ErrorView.swift
//  TheMovieCatalogue
//
//  Created by Leo Avalos on 11/08/23.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
            Text(errorMessage)
                .multilineTextAlignment(.center)
                .padding()
        }
    }}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Unknown")
    }
}
