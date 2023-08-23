//
//  HomeView.swift
//  InternApp
//
//  Created by mert Kanak on 23.08.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                        .padding(22)
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 33))
                        .foregroundColor(.blue)
                        .offset(x: 65, y: -100)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                VStack {
                    Text("Mert Kanak")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: 20, y: -60)
                    Text("Points")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x: 200, y: -220)
                    Text("300")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .offset(x:200, y: -200)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
