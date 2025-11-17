import SwiftUI

struct cameraViewWrapper: View {
    @ObservedObject var appState: AppState
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            cameraButton(
                icon: "camera.fill",
                title: "Take Photo",
                selected: true,
                appState: appState,
                selectedTab: $selectedTab
            )
        }
    }
}
