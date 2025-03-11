# Quickr App - Screen Checklist

This document provides a comprehensive list of all screens needed for the Quickr app, with detailed requirements for each screen.

## Authentication & Onboarding

- [x] **Splash Screen**
  - [x] Display app logo and branding
  - [x] Smooth transition to login/signup screen
  - [x] Check for existing authentication

- [ ] **Login Screen**
  - [ ] Email/username field
  - [ ] Password field
  - [ ] "Forgot Password" option
  - [ ] Login button
  - [ ] Option to navigate to signup
  - [ ] Error handling for invalid credentials

- [ ] **Signup Screen**
  - [ ] Username field (with availability check)
  - [ ] Email field (with validation)
  - [ ] Password field (with strength indicator)
  - [ ] Confirm password field
  - [ ] Terms & Privacy Policy agreement checkbox
  - [ ] Age verification (17+ requirement)
  - [ ] Signup button
  - [ ] Option to navigate to login
  - [ ] Error handling for invalid inputs

- [ ] **Forgot Password Screen**
  - [ ] Email field
  - [ ] Submit button
  - [ ] Confirmation message
  - [ ] Return to login option

- [x] **Onboarding Tutorial**
  - [x] Brief walkthrough of app features (swipeable cards)
  - [x] Privacy & security explanation
  - [x] Ephemeral content explanation
  - [x] Skip option
  - [x] "Get Started" button

## Main Navigation

- [ ] **Tab Bar**
  - [ ] Home tab (photo feed)
  - [ ] Friends tab
  - [ ] Camera/Upload tab
  - [ ] Premium tab (if applicable)
  - [ ] Profile tab
  - [ ] Visual indicators for new content

## Home Feed

- [ ] **Photo Feed Screen**
  - [ ] Full-screen photo cards
  - [ ] Swipe right to like, left to skip
  - [ ] Caption display at bottom of card
  - [ ] Ephemeral timer indicator
  - [ ] Like button overlay
  - [ ] Skip button overlay
  - [ ] Visual feedback for swipe actions
  - [ ] Empty state for when no photos are available
  - [ ] Pull-to-refresh functionality

- [ ] **Photo Detail View**
  - [ ] Full-screen photo display
  - [ ] Caption display
  - [ ] Viewing timer countdown
  - [ ] Like/reaction options
  - [ ] Report button
  - [ ] Sender information
  - [ ] Timestamp
  - [ ] Security indicators (private/public)
  - [ ] Auto-dismiss after viewing time expires

## Photo Creation & Sharing

- [ ] **Camera Screen**
  - [ ] Camera preview
  - [ ] Capture button
  - [ ] Flash toggle
  - [ ] Front/back camera toggle
  - [ ] Gallery access button
  - [ ] Cancel button

- [ ] **Photo Edit Screen**
  - [ ] Photo preview
  - [ ] Caption input field (single line)
  - [ ] Filter options (standard iOS filters)
  - [ ] Ephemeral settings selection:
    - [ ] Overall visibility duration options (1 hour, 4 hours, 8 hours)
    - [ ] Viewing duration options (15 seconds, 30 seconds, 1 minute)
  - [ ] Privacy toggle (public/private)
  - [ ] Back button
  - [ ] Next button

- [ ] **Recipient Selection Screen**
  - [ ] Friend list with search
  - [ ] Selected recipients indicator
  - [ ] Multi-select capability (up to 7 for free users, 20 for premium)
  - [ ] Recently contacted list
  - [ ] Send button
  - [ ] Back button
  - [ ] Confirmation of sending

## Friend Management

- [ ] **Friends List Screen**
  - [ ] Searchable list of friends
  - [ ] Add friend button
  - [ ] Friend request notifications
  - [ ] Remove friend option
  - [ ] Block user option
  - [ ] Empty state for no friends

- [ ] **Friend Search Screen**
  - [ ] Search by username
  - [ ] Search by unique user code
  - [ ] Results display
  - [ ] Add friend button
  - [ ] Back button

- [ ] **Friend Invite Screen**
  - [ ] Deep link generation
  - [ ] Share options (messaging apps, social media, etc.)
  - [ ] Copy link button
  - [ ] Personal invite message option
  - [ ] Back button

- [ ] **Friend Requests Screen**
  - [ ] Incoming requests list
  - [ ] Accept/decline buttons
  - [ ] Empty state for no requests
  - [ ] Back button

## Profile & Settings

- [ ] **Profile Screen**
  - [ ] Profile picture
  - [ ] Username display
  - [ ] Unique user code display
  - [ ] Edit profile button
  - [ ] Settings button
  - [ ] Premium status indicator (if applicable)
  - [ ] Photos sent/received count

- [ ] **Edit Profile Screen**
  - [ ] Profile picture edit
  - [ ] Username edit (with availability check)
  - [ ] Bio/description field (optional)
  - [ ] Save changes button
  - [ ] Cancel button

- [ ] **Settings Screen**
  - [ ] Account settings section
  - [ ] Privacy settings section
  - [ ] Notification settings section
  - [ ] Premium subscription section
  - [ ] Help & Support section
  - [ ] About section
  - [ ] Logout button
  - [ ] Delete account option

- [ ] **Privacy Settings Screen**
  - [ ] Default photo privacy setting
  - [ ] Default ephemeral duration settings
  - [ ] Screenshot notification preferences
  - [ ] Blocked users list
  - [ ] Back button

- [ ] **Notification Settings Screen**
  - [ ] New photo notifications toggle
  - [ ] Friend request notifications toggle
  - [ ] Security event notifications toggle
  - [ ] Marketing notifications toggle (opt-in only)
  - [ ] Back button

## Premium Features

- [ ] **Premium Subscription Screen**
  - [ ] Subscription tier options (Quickr+, Content Creator)
  - [ ] Feature comparison
  - [ ] Pricing information
  - [ ] Subscribe buttons
  - [ ] Restore purchases button
  - [ ] Terms & conditions link
  - [ ] Privacy policy link
  - [ ] Back button

- [ ] **Analytics Dashboard** (Premium only)
  - [ ] Viewer statistics
  - [ ] Engagement metrics
  - [ ] Security event logs
  - [ ] Historical data charts
  - [ ] Export options
  - [ ] Date range selector
  - [ ] Back button

- [ ] **Exclusive Galleries** (Premium only)
  - [ ] Gallery list
  - [ ] Gallery creation interface
  - [ ] Gallery management options
  - [ ] Subscriber-only content indicators
  - [ ] Back button

- [ ] **Enhanced Security Options** (Premium only)
  - [ ] Custom watermark settings
  - [ ] Self-destruct configuration
  - [ ] Advanced privacy controls
  - [ ] Security log
  - [ ] Back button

## Widget Configuration

- [ ] **Widget Setup Screen**
  - [ ] Widget preview
  - [ ] Widget size options
  - [ ] Content selection
  - [ ] Privacy reminder (blurred photos only)
  - [ ] Save configuration button
  - [ ] Back button

## Miscellaneous

- [ ] **Error Screens**
  - [ ] Network error
  - [ ] Authentication error
  - [ ] Permission error
  - [ ] General error with retry option

- [ ] **Loading Screens/Indicators**
  - [ ] Initial load
  - [ ] Content loading
  - [ ] Action processing

- [ ] **Confirmation Dialogs**
  - [ ] Delete confirmation
  - [ ] Logout confirmation
  - [ ] Subscription confirmation
  - [ ] Friend removal confirmation

- [ ] **Report Content Screen**
  - [ ] Reason selection
  - [ ] Additional details input
  - [ ] Submit button
  - [ ] Cancel button
  - [ ] Confirmation message

- [ ] **Help & Support Screen**
  - [ ] FAQ section
  - [ ] Contact support option
  - [ ] Feedback form
  - [ ] App version information
  - [ ] Back button

## Accessibility Features

- [x] **VoiceOver Support**
  - [x] Proper accessibility labels and hints for all UI elements
  - [x] Custom actions for swipe gestures
  - [x] Announcements for timer events and state changes
  - [x] Semantic roles for UI elements

- [x] **Dynamic Type Support**
  - [x] Text scaling based on user preferences
  - [x] Layout adjustments for larger text sizes
  - [x] Minimum tap target sizes

- [x] **Reduced Motion Support**
  - [x] Alternative non-animated UI for motion-sensitive users
  - [x] Simplified transitions
  - [x] Static alternatives to animations

- [x] **Color and Contrast**
  - [x] Sufficient contrast ratios for text
  - [x] Non-color indicators for important states
  - [x] Support for system contrast settings

- [x] **Alternative Input Methods**
  - [x] Keyboard navigation support
  - [x] Button alternatives to gestures
  - [x] Switch Control compatibility