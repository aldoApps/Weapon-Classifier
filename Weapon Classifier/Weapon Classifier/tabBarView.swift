import SwiftUI
import Combine
struct tabBarView: View {
    @State private var selectedTab: Int = 0
    @StateObject private var appState = AppState()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                case 0:
                    if let photo = appState.classifiedPhoto,
                       let result = appState.classificationResult {
                        
                        resultView(
                            image: photo,
                            classification: result,
                            additionalInfo: appState.additionalInfo ?? "No additional info"
                        )
                        
                    } else {
                        mainView()
                    }
                case 1:
                    cameraViewWrapper(appState: appState, selectedTab: $selectedTab)
                default:
                    preferencesView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            
            HStack {
                tabButton(icon: "house.fill", title: "History", selected: selectedTab == 0) {
                    selectedTab = 0
                }
                Spacer()
                cameraButton(
                    icon: "camera.fill",
                    title: "Camera",
                    selected: selectedTab == 1,
                    appState: appState,
                    selectedTab: $selectedTab
                )
                Spacer()
                tabButton(icon: "gearshape.fill", title: "Preferences", selected: selectedTab == 2) {
                    selectedTab = 2
                }
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 15)
            .padding(.bottom, 5)
            .background(.white)
        }
        .ignoresSafeArea(edges: .all)
    }
}
