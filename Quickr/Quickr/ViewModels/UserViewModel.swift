//
//  UserViewModel.swift
//  Quickr
//
//  Created by Raphael on 11/03/2025.
//

import Foundation
import Combine
import SwiftUI
import AuthenticationServices

/// UserViewModel is responsible for managing user authentication and profile data
class UserViewModel: ObservableObject {
    // MARK: - Published Properties
    
    /// Current authenticated user
    @Published var currentUser: User?
    
    /// Loading state
    @Published var isLoading = false
    
    /// Error message
    @Published var errorMessage: String?
    
    /// Authentication state
    @Published var isAuthenticated = false
    
    /// Onboarding completion state
    @Published var hasCompletedOnboarding = false
    
    /// Sign up mode state
    @Published var isSignUp = false
    
    /// Forgot password state
    @Published var showForgotPassword = false
    
    /// Premium status
    @Published var isPremium = false
    
    /// Premium tier
    @Published var premiumTier: PremiumTier = .none
    
    // MARK: - Private Properties
    
    /// Supabase manager instance
    private let supabaseManager = SupabaseManager.shared
    
    /// Cancellables set for managing subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init() {
        checkAuthenticationState()
    }
    
    // MARK: - Authentication Methods
    
    /// Checks the current authentication state
    func checkAuthenticationState() {
        if let session = supabaseManager.getSession(), let user = session.user {
            isAuthenticated = true
            fetchUserProfile(userId: UUID(uuidString: user.id)!)
        } else {
            isAuthenticated = false
            currentUser = nil
        }
    }
    
    /// Signs up a new user
    /// - Parameters:
    ///   - email: User's email
    ///   - password: User's password
    ///   - username: User's username
    func signUp(email: String, password: String, username: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let session = try await supabaseManager.signUp(email: email, password: password)
                
                guard let user = session.user else {
                    throw NSError(domain: "UserViewModel", code: 1, userInfo: [NSLocalizedDescriptionKey: "User not found after signup"])
                }
                
                let userId = UUID(uuidString: user.id)!
                
                // Create user profile
                try await supabaseManager.createProfile(userId: userId, username: username)
                
                // Fetch the complete profile
                await fetchUserProfile(userId: userId)
                
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.isLoading = false
                    self.hasCompletedOnboarding = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    /// Signs in an existing user
    /// - Parameters:
    ///   - email: User's email
    ///   - password: User's password
    func signIn(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let session = try await supabaseManager.signIn(email: email, password: password)
                
                guard let user = session.user else {
                    throw NSError(domain: "UserViewModel", code: 1, userInfo: [NSLocalizedDescriptionKey: "User not found after signin"])
                }
                
                let userId = UUID(uuidString: user.id)!
                
                // Fetch the user profile
                await fetchUserProfile(userId: userId)
                
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    /// Signs out the current user
    func signOut() {
        isLoading = true
        
        Task {
            do {
                try await supabaseManager.signOut()
                
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                    self.currentUser = nil
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    /// Resets password for a user
    /// - Parameter email: User's email
    func resetPassword(email: String) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                try await supabaseManager.resetPassword(email: email)
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.showForgotPassword = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    // MARK: - Profile Methods
    
    /// Fetches the user profile
    /// - Parameter userId: User's ID
    func fetchUserProfile(userId: UUID) async {
        do {
            if let profileData = try await supabaseManager.getProfile(userId: userId) {
                let username = profileData["username"] as? String ?? ""
                let avatarUrl = profileData["avatar_url"] as? String
                let isPremium = profileData["is_premium"] as? Bool ?? false
                let premiumTierString = profileData["premium_tier"] as? String ?? ""
                let hasCompletedOnboarding = profileData["has_completed_onboarding"] as? Bool ?? false
                
                // Determine premium tier
                let premiumTier: PremiumTier
                if !isPremium {
                    premiumTier = .none
                } else if premiumTierString == "quickr_plus" {
                    premiumTier = .quickrPlus
                } else if premiumTierString == "content_creator" {
                    premiumTier = .contentCreator
                } else {
                    premiumTier = .none
                }
                
                DispatchQueue.main.async {
                    self.currentUser = User(
                        id: userId.uuidString,
                        email: self.supabaseManager.getCurrentUser()?.email ?? "",
                        username: username,
                        avatarUrl: avatarUrl,
                        premiumTier: premiumTier
                    )
                    self.isPremium = isPremium
                    self.premiumTier = premiumTier
                    self.hasCompletedOnboarding = hasCompletedOnboarding
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    /// Updates the user profile
    /// - Parameters:
    ///   - updates: Dictionary of fields to update
    func updateProfile(updates: [String: Any]) {
        guard let userId = UUID(uuidString: currentUser?.id ?? "") else {
            errorMessage = "Invalid user ID"
            return
        }
        
        isLoading = true
        
        Task {
            do {
                try await supabaseManager.updateProfile(userId: userId, updates: updates)
                
                // Refresh the profile
                await fetchUserProfile(userId: userId)
                
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    /// Completes the onboarding process
    func completeOnboarding() {
        // Mark onboarding as completed in UserDefaults
        if let userId = currentUser?.id {
            UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding_\(userId)")
            hasCompletedOnboarding = true
            
            // Also update the profile in the database if we have a valid UUID
            if let uuid = UUID(uuidString: userId) {
                updateProfile(updates: ["has_completed_onboarding": true])
            }
        } else {
            errorMessage = "Invalid user ID"
        }
    }
    
    /// Uploads a profile avatar
    /// - Parameter imageData: Image data to upload
    func uploadAvatar(imageData: Data) {
        guard let userId = UUID(uuidString: currentUser?.id ?? "") else {
            errorMessage = "Invalid user ID"
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let path = "\(userId.uuidString)/avatar.jpg"
                let url = try await supabaseManager.uploadFile(
                    data: imageData,
                    path: path,
                    bucket: .avatars,
                    contentType: "image/jpeg"
                )
                
                // Update profile with new avatar URL
                try await supabaseManager.updateProfile(
                    userId: userId,
                    updates: ["avatar_url": url.absoluteString]
                )
                
                // Refresh the profile
                await fetchUserProfile(userId: userId)
                
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}

// MARK: - User Model

/// User model representing an authenticated user
struct User: Identifiable, Equatable {
    let id: String
    let email: String
    let username: String
    let avatarUrl: String?
    let premiumTier: PremiumTier
    
    var isPremium: Bool {
        return premiumTier != .none
    }
}

/// Premium tier options
enum PremiumTier: String {
    case none = "none"
    case quickrPlus = "quickr_plus"
    case contentCreator = "content_creator"
}

// MARK: - Preview Helpers

extension UserViewModel {
    /// Create a mock view model for previews
    static func mockAuthenticated() -> UserViewModel {
        let viewModel = UserViewModel()
        viewModel.currentUser = User.mockUser()
        viewModel.isAuthenticated = true
        viewModel.hasCompletedOnboarding = true
        return viewModel
    }
    
    /// Create a mock premium view model for previews
    static func mockPremium() -> UserViewModel {
        let viewModel = UserViewModel()
        viewModel.currentUser = User.mockPremiumUser()
        viewModel.isAuthenticated = true
        viewModel.hasCompletedOnboarding = true
        return viewModel
    }
}

// MARK: - User Model Extensions

extension User {
    /// Create a mock user for previews
    static func mockUser() -> User {
        return User(
            id: UUID().uuidString,
            email: "user@example.com",
            username: "testuser",
            avatarUrl: nil,
            premiumTier: .none
        )
    }
    
    /// Create a mock premium user for previews
    static func mockPremiumUser() -> User {
        return User(
            id: UUID().uuidString,
            email: "premium@example.com",
            username: "premiumuser",
            avatarUrl: nil,
            premiumTier: .quickrPlus
        )
    }
}