//
//  AppState.swift
//  Weapon Classifier
//
//  Created by Ismoilov Abdullokh on 14/11/25.
//
import Combine
import SwiftUI

// Shared app state to store latest photo and classification
class AppState: ObservableObject {
    @Published var classifiedPhoto: UIImage?
    @Published var classificationResult: String?
    @Published var additionalInfo: String?
}
