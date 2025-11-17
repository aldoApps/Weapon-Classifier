import SwiftUI

struct resultView: View {
    let image: UIImage
    let classification: String
    let additionalInfo: String      
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
                    .cornerRadius(20)
                    .clipped()
                    .shadow(radius: 10)
                    .padding()
                
                Text("\(classification)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Details")
                        .font(.headline)
                    
                    Text(additionalInfo)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true) // enable multiline
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.horizontal)
            }
            .padding(.top, 50)
        }
        .navigationTitle("Classification Result")
        .navigationBarTitleDisplayMode(.inline)
    }
}
