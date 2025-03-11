# Quickr Product Requirements Document (PRD) – Updated

## 1. Overview

**Quickr** is a privacy-focused, ad-free photo-sharing iOS app designed to provide secure and ephemeral photo communication among friends. Quickr uses a Tinder/Happn–style swipe interface so that photos are browsed quickly and securely. Key aspects include:
- **Ad-Free Environment:** Quickr is completely free of advertisements.
- **Privacy & Security:** All photos are end-to-end encrypted, and private photos are automatically blurred in widgets and notifications.
- **Ephemeral Photo Sharing:** Users can set a specific time (e.g., 1 hour, 4 hours, 8 hours) for which their photo is visible; after that period, the photo is automatically deleted.
- **Ephemeral Photo Viewing:** When a photo is opened, it is visible for a user-set time (e.g., 15 seconds, 30 seconds, 1 minute); after that period, the photo becomes no longer visible.
- **Captioning Feature:** Users can add a single line of text (a caption) to photos in a style similar to Instagram or Snapchat.
- **Premium Enhancements:** Advanced tools for content creators via a subscription tier, including detailed analytics, exclusive galleries, customizable watermarking, and enhanced security options.
- **Simplified, Photo-Only Experience:** There is no chat functionality; the app is strictly focused on secure, photo-based interactions.
- **Friend Invite & Search:** Users can invite friends via deep link sharing through known platforms and search for friends by username or a unique user code.
- **Ephemeral Photo Filters:** Users can apply standard iOS filters on photos alongside the captioning feature.

---

## 2. Goals & Objectives

- **Privacy-First Photo Sharing:**  
  Ensure that all photos are securely encrypted and that private photos remain protected (displayed as blurred in widgets and notifications).

- **Ephemeral Experience:**  
  Allow users to control the visibility of their photos:
  - Set a duration for overall photo sharing (e.g., 1 hour, 4 hours, 8 hours) after which the photo is deleted.
  - Set a separate viewing duration (e.g., 15 seconds, 30 seconds, 1 minute) once a photo is opened.

- **Engaging Swipe Interface:**  
  Deliver an intuitive, Tinder/Happn–style swipe interface for fast browsing and liking of photos.

- **Enhanced Photo Customization:**  
  Enable users to add a caption (a single line of text) to each photo in a familiar style.

- **Premium Creator Tools:**  
  Provide advanced analytics, exclusive galleries, enhanced watermarking, and security options through premium subscription tiers.

- **Ad-Free Commitment:**  
  Maintain a completely ad-free experience for all users.

- **Friend Management:**  
  Allow users to invite friends via deep links and search for them by username or unique user code to build their contact list.

- **Ephemeral Photo Filters:**  
  Allow users to apply standard iOS filters to photos, complementing captioning and customization.

---

## 3. Target Audience

- **General Users:**  
  Privacy-conscious individuals seeking a secure, ephemeral, and intuitive photo-sharing experience.

- **Content Creators:**  
  Photographers and influencers who need advanced analytics, exclusive content galleries, and enhanced security features for their photos.

- **Privacy Advocates:**  
  Users who prioritize minimal data retention and strong privacy controls, benefiting from Quickr's ephemeral design.

---

## 4. Core Features & Requirements

### 4.1 Swipe-Based Photo Viewing
- [ ] **Dynamic Card Swiping:**
  - [ ] Implement a full-screen, card-based interface for browsing photos.
  - [ ] Enable swipe right to "like" and left to skip, with smooth, fluid animations.
  - [ ] Provide visual feedback (e.g., a subtle heart icon) during the swipe gesture.

- [ ] **Interactive Overlays:**
  - [ ] Allow users to tap a photo to view additional details (e.g., photo metadata) without triggering chat functions.
  - [ ] Ensure overlays are minimal and seamlessly integrated.

### 4.2 Photo Customization & Ephemeral Settings
- [ ] **Captioning Feature:**
  - [ ] Allow users to add a single line of text (caption) to photos.
  - [ ] Style the caption in a modern, Instagram/Snapchat–inspired design.
  - [ ] Ensure captions are stored temporarily with the photo and removed when the photo is deleted.

- [ ] **Ephemeral Photo Sharing:**
  - [ ] Allow users to set a photo's overall visibility duration (e.g., 1 hour, 4 hours, 8 hours).
  - [ ] Automatically delete the photo and its metadata (including caption) once the duration expires.
  - [ ] Collect only the minimal necessary data (e.g., timestamp) to enforce this feature.

- [ ] **Ephemeral Photo Viewing:**
  - [ ] Allow users to set a viewing duration for when a photo is opened (e.g., 15 seconds, 30 seconds, 1 minute).
  - [ ] Automatically disable visibility of the photo after the viewing period ends.

- [ ] **Ephemeral Photo Filters:**
  - [ ] Enable users to apply standard iOS filters to photos.
  - [ ] Integrate filter options in the photo editing interface alongside captioning.

### 4.3 Privacy & Security
- [ ] **End-to-End Encryption:**
  - [ ] Encrypt all photos during upload, transit, and storage using iOS's CryptoKit or a similar framework.

- [ ] **Screenshot & Screen Recording Protection:**
  - [ ] Monitor for screenshots and screen recordings using public iOS APIs.
  - [ ] Automatically blur private photos and overlay a watermark when unauthorized capture is detected.
  - [ ] Ensure widgets display only a blurred version of private photos.

- [ ] **Discreet Notifications:**
  - [ ] Implement notifications that discreetly alert users about new photos or security events without revealing sensitive content.

- [ ] **Minimal Data Collection:**
  - [ ] Collect only the necessary data (e.g., timestamps for photo deletion) required to support ephemeral features.
  - [ ] Automatically delete associated data once the photo's visibility period expires.

### 4.4 Non-Premium (Free) Features
- [ ] **Standard Photo Sharing:**
  - [ ] Enable users to securely upload, view, and share photos.
  - [ ] Provide basic privacy controls (e.g., marking photos as private).

- [ ] **Basic Emoticon Reactions:**
  - [ ] Allow users to "like" photos using simple emoticons.

- [ ] **Default Content Moderation:**
  - [ ] Implement baseline filtering for objectionable content.
  - [ ] Include an in-app "Report" button for flagging inappropriate content.
  - [ ] Provide basic blocking features to prevent abusive interactions.

- [ ] **Friend Invite & Search:**
  - [ ] Allow users to invite friends via deep link sharing.
  - [ ] Enable friend search by username or unique user code.
  - [ ] Provide a way to add friends to a personal contact list.

- [ ] **Multi-Recipient Sharing:**
  - [ ] Allow multi-recipient sending/sharing up to 7 people

### 4.5 Premium Features (Content Creator)
- [ ] **Advanced Analytics Dashboard (for Creators):**
  - [ ] Provide detailed insights, including who viewed photos, engagement trends, and security events.
  - [ ] Display visual charts and historical data for optimizing content strategy.

- [ ] **Send only:**
  - [ ] Creators have the ability to turn on "send only" people will not be able to send images to them

- [ ] **Gifting system:**
  - Creators can turn on gifting system where subscribers can gift "Quickr" bucks. 
  - Quickr bucks can be purchased trough app store. 
    - 100 Quickr bucks 9,99
    - 400 Quickr bucks 29,99
    - 1000 Quickr bucks 99,99
 
- [ ] **Exclusive Galleries:**
  - [ ] Unlock subscriber-only galleries featuring curated, premium content.
  - [ ] Seamlessly integrate these galleries into the app's navigation.

- [ ] **Enhanced Security Options:**
  - [ ] Allow premium users to customize watermark designs (e.g., logos, custom text).
  - [ ] Provide a "self-destruct" option to remotely disable photos after repeated security events.

- [ ] **Group Sending / Multi-Recipient Sharing:**
  - [ ] Enable premium creators to send photos to designated groups or communities.
  - [ ] Integrate group sending naturally within the photo sharing flow.

- [ ] **Custom Subscription Tiers:**
  - [ ] Use Apple's in-app purchase system to offer various premium tiers.
  - [ ] Clearly display the benefits of each tier (advanced analytics, exclusive galleries, enhanced security) in a subtle manner.

### 4.6 Premium Features (Quickr+)
- [ ] **Advanced Analytics Dashboard:**
  - [ ] Provide detailed insights, including who viewed photos, engagement trends.
  - [ ] Display visual charts and historical data for optimizing content strategy.

- [ ] **Enhanced Security Options:**
  - [ ] Allow Quickr+ users to customize watermark (custom text).

- [ ] **Multi-Recipient Sharing:**
  - [ ] Enable premium (Quickr+) to Allow multi-recipient sending/sharing up to 20 people.

- [ ] **Full Emoticon Reactions:**
  - [ ] Allow Quickr+ users to "like" photos using all emoticons.

- [ ] **Extend time:**
  - [ ] Allow Quickr+ users to extend the photo-visibility timer up to 2 minutes
  - [ ] Allow Quickr+ users to extend overall visibility duration (e.g., 16 hours 24 hours)

### 4.7 Widget Integration
- [ ] **Widget Setup Using WidgetKit:**
  - [ ] Create a widget that displays a blurred version of private photos.
  - [ ] Ensure the widget reads data from the shared App Group container.
  - [ ] Test the widget to verify that no sensitive content is revealed.

---

## 5. Non-Functional Requirements

- [ ] **Performance:**
  - [ ] Ensure the swipe interface is smooth and responsive.
  - [ ] Optimize encryption and security processes to minimize impact on performance.

- [ ] **Security & Compliance:**
  - [ ] Adhere to all Apple guidelines regarding encryption, data handling, and privacy.
  - [ ] Implement an in-app account deletion process.
  - [ ] Limit data collection strictly to what is necessary for enforcing ephemeral features.

- [ ] **Accessibility & Usability:**
  - [ ] Follow iOS Human Interface Guidelines.
  - [ ] Provide alternative navigation for users unable to use swipe gestures.
  - [ ] Ensure all UI elements (widgets, subscription flows, etc.) are intuitive and accessible.

- [ ] **Scalability:**
  - [ ] Use scalable backend services (e.g., Supabase, AWS) to handle increasing user data.
  - [ ] Optimize backend processes for real-time analytics and security event processing.

---

## 6. Technical & Architectural Requirements

- [ ] **Platform:**
  - [ ] Develop the iOS app using Swift and SwiftUI (or UIKit, if preferred).
  - [ ] Leverage Apple's native frameworks for encryption, IAP, and secure data storage.

- [ ] **UI & Swipe Components:**
  - [ ] Build custom UI components for card swiping.
  - [ ] Integrate gesture recognizers for intuitive swipe actions.

- [ ] **Security Layer:**
  - [ ] Implement encryption using CryptoKit.
  - [ ] Develop event listeners for screenshot/screen recording detection.
  - [ ] Integrate a watermarking engine for applying default and customizable watermarks.

- [ ] **Backend & Supabase Integration:**
  - [ ] Set up a Supabase project for temporary encrypted photo storage.
  - [ ] Configure the Supabase database schema (Users, Images, Subscriptions, Engagement).
  - [ ] Create a secure storage bucket for photos and enforce access policies.
  - [ ] Securely store and retrieve the necessary API keys and endpoints in the app's configuration.

- [ ] **In-App Purchase & Subscription Setup:**
  - [ ] Use Apple's StoreKit to implement premium subscriptions.
  - [ ] Configure subscription tiers in App Store Connect and integrate them into the app.
  - [ ] Implement a "Restore Purchases" function for existing subscribers.

- [ ] **Widget & Shared Data:**
  - [ ] Enable App Groups in both the main app and widget targets.
  - [ ] Use shared data containers (e.g., UserDefaults with the App Group) to sync data between the main app and widget.
  - [ ] Test data sharing to ensure the widget displays only blurred private photos.

---

## 7. User Stories

### 7.1 Casual User Flow
- **As a casual user, I want to swipe through photos in a full-screen, Tinder-style interface** so I can quickly browse and "like" photos.
- **As a privacy-conscious user, I want my private photos to appear blurred in widgets and notifications** so that sensitive content remains secure.
- **As a user, I want to add a caption to my photo** (in an Instagram/Snapchat style) to express a quick thought or context.
- **As a user, I want to set an expiration timer for my photos** (e.g., visible for 1 hour, 4 hours, or 8 hours) so that they are automatically deleted after the set period.
- **As a user, when I open a photo, I want it to be visible only for a short duration** (e.g., 15 seconds, 30 seconds, 1 minute) before it is no longer visible.
- **As a user, I want to apply standard iOS filters to my photos** as an optional enhancement.

### 7.2 Content Creator Flow
- **As a creator, I want to access an advanced analytics dashboard** so I can see detailed insights on who viewed my photos, engagement trends, and security events.
- **As a creator, I want to unlock exclusive galleries for subscribers** so that I can offer premium content without compromising the free experience.
- **As a creator, I want enhanced security options, like customizable watermarking,** to protect my photos if screenshots are taken.
- **As a creator, I want to invite and search for friends using a unique username or code** so I can build my contact list.
- **As a creator, I want to send photos to designated groups** (without a chat function) to share content selectively.

---

## 8. FAQ

**Q: Snapchat allows nudity in private messages. Why doesn't Snapchat get banned?**  
**A:** Snapchat is permitted because it enforces strict age restrictions (typically a 17+ rating), uses robust privacy and security measures (such as ephemeral content and effective content moderation), and ensures that sensitive content is shared privately rather than publicly. Quickr adopts a similar approach by focusing on privacy and secure, ephemeral photo sharing, thereby complying with Apple's guidelines.

---

## 9. Milestones & Roadmap

1. **Phase 1 – MVP Development:**
   - [ ] Build core swipe-based photo browsing interface.
   - [ ] Implement end-to-end encryption and secure photo storage.
   - [ ] Set up basic privacy controls and default content moderation.
   - [ ] Integrate screenshot detection and automatic watermarking.

2. **Phase 2 – Widget & Basic Features:**
   - [ ] Develop and integrate the widget (displaying blurred private photos).
   - [ ] Set up discreet push notifications for new photos and security events.
   - [ ] Implement basic emoticon reactions.
   - [ ] Add captioning functionality for photos.
   - [ ] Implement ephemeral settings for overall photo visibility (e.g., 1 hour, 4 hours, 8 hours) with automatic deletion.
   - [ ] Implement ephemeral photo viewing settings (e.g., visible for 15/30 seconds or 1 minute once opened).
   - [ ] Integrate standard iOS filters into the photo editing interface.

3. **Phase 3 – Premium Features:**
   - [ ] Build the advanced analytics dashboard for creators.
   - [ ] Develop exclusive galleries and premium subscription flows via IAP.
   - [ ] Implement enhanced security options (customizable watermarking and self-destruct features).
   - [ ] Enable group sending/multi-recipient photo sharing.
   - [ ] Configure custom subscription tiers in App Store Connect.

4. **Phase 4 – Friend Management & Final Testing:**
   - [ ] Implement friend invite functionality via deep links.
   - [ ] Implement friend search and add-by-unique-code features.
   - [ ] Complete end-to-end testing of the app (UI, backend, security, widget, IAP).
   - [ ] Verify Supabase integration for photo and data storage.
   - [ ] Ensure full compliance with Apple guidelines (privacy, IAP, and moderation).
   - [ ] Archive and submit the app via TestFlight, then prepare for App Store review.