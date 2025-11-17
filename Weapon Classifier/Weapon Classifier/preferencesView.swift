//
//  preferencesView.swift
//  Weapon Classifier
//
//  Created by Ismoilov Abdullokh on 13/11/25.
//

import SwiftUI

struct preferencesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    Text("Preferences")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    Text("User preferences")
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding()
                VStack{
                    HStack{
                        VStack{
                            Text("Get PRO")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.horizontal)
                                .frame(maxWidth: 350,alignment: .topLeading)
                            Text("Unclock all premium features")
                                .foregroundStyle(.gray)
                                .padding(.bottom,5)
                                .padding(.horizontal)
                                .frame(maxWidth: 350,alignment: .topLeading)
                            VStack{
                                Text("Upgrade Now")
                                    .padding(5)
                                    .frame(maxWidth: 150,alignment: .center)
                                    .foregroundStyle(.white)
                                    .background(.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: 350,alignment: .topLeading)
                        }
                        VStack{
                            Image(systemName: "flame")
                                .foregroundStyle(.orange)
                                .font(.largeTitle.bold())
                        }
                    }
                    .padding()
                }
                .background(Color.black.opacity(0.8))
                .cornerRadius(10)
                .padding()
                .frame(maxWidth: 370, alignment: .topLeading)
                VStack{
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.blue)
                        Text("Share App")
                    }
                    .padding(.vertical,10)
                    .frame(maxWidth: 350,alignment: .topLeading)
                    HStack{
                        Image(systemName: "crown")
                            .foregroundStyle(.blue)
                        Text("Rate us")
                    }
                    .padding(.vertical,10)
                    .frame(maxWidth: 350, alignment: .topLeading)
                    HStack{
                        Image(systemName: "checkmark.shield")
                            .foregroundStyle(.blue)
                        Text("Privacy Policy")
                    }
                    .padding(.vertical,10)
                    .frame(maxWidth: 350, alignment: .topLeading)
                    HStack{
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .foregroundStyle(.blue)
                        Text("Terms of Service")
                    }
                    .frame(maxWidth: 350, alignment: .topLeading)
                    .padding(.vertical, 10)
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .frame(maxWidth: 350, maxHeight: .infinity, alignment: .topLeading)
            }
            .background(Color.gray.opacity(0.08))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    preferencesView()
}
