import SwiftUI

struct ContentView: View {
    var body: some View {
        MetalViewRepresentable()
            .frame(width: 300, height: 300) // Set the frame size as needed
            .border(Color.gray, width: 2) // Optional: Adds a border for visual clarity
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
