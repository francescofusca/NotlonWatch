//  NotionWatch/ViewModels/SettingsViewModel.swift
import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    @Published var notionAPIKey: String {
        didSet { saveSettings() }
    }
    @Published var notionDatabaseID: String {
        didSet { saveSettings() }
    }
    @Published var cloudinaryAPIKey: String {
        didSet { saveSettings() }
    }
    @Published var cloudinaryAPISecret: String {
        didSet { saveSettings() }
    }
    @Published var cloudinaryCloudName: String {
        didSet { saveSettings() }
    }
    @Published var showingAlert = false
    @Published var alertMessage = ""

    private let userDefaults = UserDefaults.standard //Istanza di user default
    private var cancellables: Set<AnyCancellable> = []

    init() {
        // Carica le impostazioni da UserDefaults
        notionAPIKey = userDefaults.string(forKey: "NotionAPIKey") ?? ""  // Carica, default ""
        notionDatabaseID = userDefaults.string(forKey: "NotionDatabaseId") ?? "" // Carica, default ""
        cloudinaryAPIKey = userDefaults.string(forKey: "CloudinaryAPIKey") ?? ""
        cloudinaryAPISecret = userDefaults.string(forKey: "CloudinaryAPISecret") ?? ""
        cloudinaryCloudName = userDefaults.string(forKey: "CloudinaryCloudName") ?? ""
    }

    private func saveSettings() {
        userDefaults.set(notionAPIKey, forKey: "NotionAPIKey") // Salva
        userDefaults.set(notionDatabaseID, forKey: "NotionDatabaseId") // Salva
        userDefaults.set(cloudinaryAPIKey, forKey: "CloudinaryAPIKey")
        userDefaults.set(cloudinaryAPISecret, forKey: "CloudinaryAPISecret")
        userDefaults.set(cloudinaryCloudName, forKey: "CloudinaryCloudName")
    }
  func showAlert(message: String) {
        alertMessage = message
        showingAlert = true
    }
}
