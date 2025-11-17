//
//  mainView.swift
//  Weapon Classifier
//
//  Created by Ismoilov Abdullokh on 13/11/25.
//

import SwiftUI

struct mainView: View {
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    Text("Collection")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Text("Identified results")
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding()
                
                VStack{
                    Image("guns")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                    Text("Nothing here yet")
                        .font(.title2)
                    Text("To identify gun, press the")
                        .foregroundStyle(.gray)
                    Text("Camera button")
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: 230, maxHeight: .infinity, alignment: .center)
            }
            .background(Color.gray.opacity(0.08))
        }
    }
}

#Preview {
    mainView()
}
