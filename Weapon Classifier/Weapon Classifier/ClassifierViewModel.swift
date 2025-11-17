//
//  ClassifierViewModel.swift
//  Weapon Classifier
//
//  Created by Ismoilov Abdullokh on 14/11/25.
//
import SwiftUI
import CoreML
import Vision
import Combine

class ClassifierViewModel: ObservableObject {
    @Published var additionalInfo: String = ""
    @Published var classification: String = "Unknown"
    
    private var model: VNCoreMLModel?
    
    init() {
        do {
            let mlModel = try ArmorClassifier(configuration: .init()).model
            model = try VNCoreMLModel(for: mlModel)
        } catch {
            print("Failed to load ML model: \(error)")
        }
    }
    
    func classify(image: UIImage, completion: @escaping (String) -> Void) {
        guard let model = model else {
            completion("Model not loaded")
            return
        }
        guard let ciImage = CIImage(image: image) else {
            completion("Failed to convert UIImage")
            return
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                completion("Vision error: \(error.localizedDescription)")
                return
            }
            
            if let results = request.results as? [VNClassificationObservation],
               let topResult = results.first {
                
                let label = topResult.identifier
                
                // Update classification result
                DispatchQueue.main.async {
                    self.classification = label
                    
                    // Attach additional info based on label
                    if let details = self.weaponInfo[label] {
                        self.additionalInfo = details
                    } else {
                        self.additionalInfo = "No additional info available."
                    }
                }
                
                completion(label)
                
            } else {
                DispatchQueue.main.async {
                    self.classification = "Unknown"
                    self.additionalInfo = "No additional info available."
                }
                
                completion("Unknown")
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                completion("Handler error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Add your extended info here
    let weaponInfo: [String: String] = [
        "ASR-118": "Airsoft replica based on the M4/Mk18 platform. Produced by APS. Fully metal. M-LOK rail system. Around 400 FPS. Uses standard M4 magazines.",
        "LK-9051": "G36-style polymer AEG rifle. 360 FPS. Inspired by Heckler & Koch G36. Compatible with standard M4 magazines.",
        "HI-CAPA": "Gas blowback pistol. Based on 1911 platform. Strong blowback. Around 330 FPS. Magazine holds 28–31 rounds."
    ]
}
