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
        NavigationView {
            List{
                ForEach(0..<viewModel.jokes.count, id: \.self) { index in
                    HStack{
                        Text(viewModel.jokes[index])
                            .font(.custom(
                                    "Poppins",
                                    fixedSize: 15))
                            .foregroundColor(.white)
                            
                    }
                    .background(Color.clear)
                    .padding(20)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.gray.opacity(0.1))
                    
                        
                }
                .background(Color.cyan)
                .cornerRadius(10, corners: [.topLeft,.bottomRight])
                .animation(Animation.spring(),value:20)
    //            .padding(5)
            }
            .navigationTitle("Jokes")
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
    
}

struct JokeTextView_Previews: PreviewProvider {
    static var previews: some View {
        JokeTextView()
    }
}
