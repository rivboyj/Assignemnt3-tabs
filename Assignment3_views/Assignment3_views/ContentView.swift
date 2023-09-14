import SwiftUI

struct ContentView: View {
    @State private var isModalOpen = false
    @State private var showAlert = false // Add this state variable for the Discover alert

    var body: some View {
        TabView {
            // Home Tab
            VStack {
                Button(action: {
                    // Open the modal sheet when the "House" is clicked
                    isModalOpen.toggle()
                }) {
                    Image(systemName: "house")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Click on the house")
                }
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            // Discovery Tab
            VStack {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Click on the glass")
            }
            .tabItem {
                Label("Discover", systemImage: "magnifyingglass")
            }
            .onTapGesture {
                // Show an alert when the "Discover" tab is tapped
                showAlert.toggle()
            }
        }
        
        .padding()
        .sheet(isPresented: $isModalOpen) {
            ModalContentView(isModalOpen: $isModalOpen)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Page Under Development"),
                message: Text("This page is still under development!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
struct ModalContentView: View {
    @Binding var isModalOpen: Bool

    var body: some View {
        NavigationView {
            TabView {
                Text("Go to front or backyard")
                    Image("Owl")
                    .tabItem {
                        Label("Backyard", systemImage: "moon.stars")
                    }
                Text("Frontyard View")
                    Image("capy")
                    .tabItem {
                        Label("Frontyard", systemImage: "sun.max")
                    }
            }
            .navigationBarTitle("Welcome!")
            .navigationBarTitleDisplayMode(.inline) // Center the title
            .navigationBarItems(leading:
                Button("Back") {
                    // Close the modal sheet and return to the original view
                    isModalOpen.toggle()
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
