import SwiftUI

struct cameraButton: View {
    let icon: String
    let title: String
    let selected: Bool
    
    @ObservedObject var appState: AppState
    @Binding var selectedTab: Int
    
    @State private var showCamera = false
    @StateObject private var classifier = ClassifierViewModel()
    @State private var photo: UIImage?
    
    var body: some View {
        Button(action: {
            // Open camera directly
            showCamera = true
        }) {
            VStack(spacing: 4) {
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
        .sheet(isPresented: $showCamera) {
            cameraView(photo: $photo) // your existing camera sheet
        }
        .onChange(of: photo) { newPhoto in
            guard let newPhoto = newPhoto else { return }
            classifier.classify(image: newPhoto) { result in
                DispatchQueue.main.async {
                    appState.classificationResult = classifier.classification
                    appState.additionalInfo = classifier.additionalInfo
                    appState.classifiedPhoto = photo
                }
            }
        }
    }
}
