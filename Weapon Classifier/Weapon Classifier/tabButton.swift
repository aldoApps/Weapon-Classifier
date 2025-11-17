//
//  tubButtonView.swift
//  Weapon Classifier
//
//  Created by Ismoilov Abdullokh on 13/11/25.
//

import SwiftUI

struct tabButton: View {
    let icon: String
    let title: String
    let selected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            VStack(spacing:4){
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(selected ? .blue : .gray)
                Text(title)
                    .font(.caption2)
                    .foregroundStyle(selected ? .blue : .gray)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
        }
    }
}
