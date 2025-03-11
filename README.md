# Quickr App

A privacy-focused, ad-free photo-sharing iOS app designed to provide secure and ephemeral photo communication among friends. Quickr uses a Tinder/Happn–style swipe interface so that photos are browsed quickly and securely.

## Key Features

- **Ad-Free Environment:** Quickr is completely free of advertisements.
- **Privacy & Security:** All photos are end-to-end encrypted, and private photos are automatically blurred in widgets and notifications.
- **Ephemeral Photo Sharing:** Users can set a specific time (e.g., 1 hour, 4 hours, 8 hours) for which their photo is visible; after that period, the photo is automatically deleted.
- **Ephemeral Photo Viewing:** When a photo is opened, it is visible for a user-set time (e.g., 15 seconds, 30 seconds, 1 minute); after that period, the photo becomes no longer visible.
- **Captioning Feature:** Users can add a single line of text (a caption) to photos in a style similar to Instagram or Snapchat.
- **Premium Enhancements:** Advanced tools for content creators via a subscription tier, including detailed analytics, exclusive galleries, customizable watermarking, and enhanced security options.
- **Simplified, Photo-Only Experience:** There is no chat functionality; the app is strictly focused on secure, photo-based interactions.
- **Friend Invite & Search:** Users can invite friends via deep link sharing through known platforms and search for friends by username or a unique user code.
- **Ephemeral Photo Filters:** Users can apply standard iOS filters on photos alongside the captioning feature.

## Technical Stack

- **Frontend:** Swift and SwiftUI for iOS
- **Backend:** Supabase for authentication, database, and storage
- **Security:** End-to-end encryption using CryptoKit
- **Widgets:** WidgetKit for iOS home screen widgets

## Documentation

The repository includes comprehensive documentation covering:
- Product Requirements Document (PRD)
- Database Schema
- API Endpoints
- Supabase Implementation
- Security Implementation
- Accessibility Features
- Widget Implementation
- Swipe Interface Implementation
- User Flow Documentation
- Project Roadmap