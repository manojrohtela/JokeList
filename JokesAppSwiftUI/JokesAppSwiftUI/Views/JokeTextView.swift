//
//  JokeTextView.swift
//  JokesAppSwiftUI
//
//  Created by Manoj Kumar on 09/06/23.
//

import SwiftUI

struct JokeTextView: View {
    @StateObject private var viewModel = JokeViewModel()
    var body: some View {
        Spacer()
        List{
            ForEach(0..<viewModel.jokes.count, id: \.self) { index in
                Text(viewModel.jokes[index])
                    .foregroundColor(.white)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .background(.clear)
                            .foregroundColor(.blue)
                            .padding(
                                EdgeInsets(
                                    top: 2,
                                    leading: 10,
                                    bottom: 2,
                                    trailing: 10
                                )
                            )
                    )
                    .listRowSeparator(.hidden)
                .shadow(radius: 5)
                .animation(.easeIn, value: 10)
            }
            .background(.clear)
        }
        
    }
}

struct JokeTextView_Previews: PreviewProvider {
    static var previews: some View {
        JokeTextView()
    }
}
