import SwiftUI
import AVFoundation
import Firebase

@main
struct NotionWatchNewApp: App {
    @StateObject private var authService = AuthService() // Cambiato da @State a @StateObject
    @State private var showSignUp = false

    init() {
        requestMicrophonePermission()
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if authService.isLoggedIn {
                ContentView(authViewModel: AuthViewModel(authService: authService))
            } else {
                VStack {
                    if showSignUp {
                        SignUpView(viewModel: AuthViewModel(authService: authService), showSignUp: $showSignUp)
                    } else {
                        LoginView(viewModel: AuthViewModel(authService: authService), showSignUp: $showSignUp)
                    }
                }
            }
        }
    }

     func requestMicrophonePermission() {
        AVAudioApplication.requestRecordPermission { granted in
            DispatchQueue.main.async {
                if granted {
                    print("DEBUG: Permesso microfono garantito")
                } else {
                    print("DEBUG: Permesso microfono negato")
                }
            }
        }
    }
}
