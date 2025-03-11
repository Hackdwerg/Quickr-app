import SwiftUI
import WidgetKit

struct WidgetConfigView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = WidgetConfigViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Widget Preview")) {
                    VStack(alignment: .center, spacing: 20) {
                        Text("Small Widget")
                            .font(.headline)
                        
                        // Small widget preview
                        ZStack {
                            Color.black
                            
                            VStack(spacing: 8) {
                                // Header
                                HStack {
                                    Image(systemName: "photo.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("Quickr")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                
                                // Photo with blur effect for privacy
                                ZStack {
                                    // Placeholder image
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white.opacity(0.5))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 80)
                                    
                                    // Privacy blur overlay
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.black.opacity(0.7))
                                        
                                        VStack(spacing: 4) {
                                            Image(systemName: "lock.fill")
                                                .font(.system(size: 16))
                                                .foregroundColor(.white)
                                            
                                            Text("Private Photo")
                                                .font(.caption)
                                                .fontWeight(.medium)
                                                .foregroundColor(.white)
                                            
                                            Text("Tap to view in app")
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .cornerRadius(12)
                                .padding(.horizontal, 12)
                            }
                        }
                        .frame(width: 170, height: 170)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                        
                        Text("Medium Widget")
                            .font(.headline)
                            .padding(.top, 20)
                        
                        // Medium widget preview
                        ZStack {
                            Color.black
                            
                            VStack(spacing: 8) {
                                // Header
                                HStack {
                                    Image(systemName: "photo.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("Quickr")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    // Timer indicator
                                    HStack(spacing: 4) {
                                        ZStack {
                                            Circle()
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                                                .frame(width: 16, height: 16)
                                            
                                            Circle()
                                                .trim(from: 0, to: 0.7)
                                                .stroke(Color.white, lineWidth: 1.5)
                                                .frame(width: 16, height: 16)
                                                .rotationEffect(.degrees(-90))
                                        }
                                        
                                        Text("2h 30m")
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                
                                // Photo with blur effect for privacy
                                ZStack {
                                    // Placeholder image
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white.opacity(0.5))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                    
                                    // Privacy blur overlay
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.black.opacity(0.7))
                                        
                                        VStack(spacing: 4) {
                                            Image(systemName: "lock.fill")
                                                .font(.system(size: 16))
                                                .foregroundColor(.white)
                                            
                                            Text("Private Photo")
                                                .font(.caption)
                                                .fontWeight(.medium)
                                                .foregroundColor(.white)
                                            
                                            Text("Tap to view in app")
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .cornerRadius(12)
                                .padding(.horizontal, 12)
                                
                                // Caption
                                Text("Caption text would appear here")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 12)
                                
                                // Sender info
                                HStack {
                                    Circle()
                                        .fill(Color.white.opacity(0.8))
                                        .frame(width: 20, height: 20)
                                        .overlay(
                                            Text("U")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundColor(.black)
                                        )
                                    
                                    Text("From @username")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    // Lock icon for private photos
                                    Image(systemName: "lock.fill")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                            }
                        }
                        .frame(width: 360, height: 170)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                }
                
                Section(header: Text("Privacy Settings"), footer: Text("All photos in widgets are always blurred for privacy. Widgets never display the actual photo content.")) {
                    Toggle("Show Recent Photos in Widget", isOn: $viewModel.showRecentPhotos)
                        .onChange(of: viewModel.showRecentPhotos) { oldValue, newValue in
                            if !newValue {
                                viewModel.clearWidgetData()
                            } else {
                                viewModel.refreshWidgetData()
                            }
                        }
                    
                    if viewModel.showRecentPhotos {
                        Picker("Maximum Photos", selection: $viewModel.maxPhotosToShow) {
                            Text("1 Photo").tag(1)
                            Text("3 Photos").tag(3)
                            Text("5 Photos").tag(5)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: viewModel.maxPhotosToShow) { oldValue, newValue in
                            viewModel.refreshWidgetData()
                        }
                    }
                }
                
                Section(header: Text("Widget Actions")) {
                    Button(action: {
                        viewModel.refreshWidgetData()
                    }) {
                        Label("Refresh Widget Data", systemImage: "arrow.clockwise")
                    }
                    
                    Button(action: {
                        viewModel.clearWidgetData()
                    }) {
                        Label("Clear Widget Data", systemImage: "xmark.circle")
                            .foregroundColor(.red)
                    }
                }
                
                Section(header: Text("How to Add a Widget"), footer: Text("Widgets provide a quick glance at your recent photos while maintaining privacy.")) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("1. Long press on your home screen")
                            .font(.subheadline)
                        
                        Text("2. Tap the + button in the top-left corner")
                            .font(.subheadline)
                        
                        Text("3. Search for 'Quickr' in the widget gallery")
                            .font(.subheadline)
                        
                        Text("4. Choose a widget size and tap 'Add Widget'")
                            .font(.subheadline)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Widget Settings")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

class WidgetConfigViewModel: ObservableObject {
    @Published var showRecentPhotos: Bool = true
    @Published var maxPhotosToShow: Int = 3
    
    init() {
        // Check if widget data exists
        let hasWidgetData = !WidgetDataManager.shared.getWidgetPhotos().isEmpty
        showRecentPhotos = hasWidgetData
    }
    
    func refreshWidgetData() {
        // Get photos from HomeViewModel or another source
        // For now, we'll use mock photos
        let photos = Photo.mockPhotos().prefix(maxPhotosToShow)
        WidgetDataManager.shared.updateWidgetPhotos(photos: Array(photos))
    }
    
    func clearWidgetData() {
        WidgetDataManager.shared.clearWidgetData()
    }
}

struct WidgetConfigView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetConfigView()
    }
}