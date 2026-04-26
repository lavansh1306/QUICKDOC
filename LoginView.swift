import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var navigateToList = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                // Header - Top Aligned
                VStack(alignment: .leading, spacing: 12) {
                    Text("QuickDoc")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                    
                    Text("Securely book your next\nmedical appointment.")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                }
                .padding(.top, 60)
                .padding(.horizontal, 24)
                
                // Form Section
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("EMAIL ADDRESS")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.leading, 4)
                        
                        TextField("e.g. sarah@example.com", text: $email)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 20)
                            .background(Color.secondary.opacity(0.08))
                           .cornerRadius(12)
                            #if os(iOS)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            #endif
                    }
                    
                    Button(action: {
                        if !email.isEmpty {
                            navigateToList = true
                        }
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(email.isEmpty ? Color.orange.opacity(0.5) : Color.orange)
                            .cornerRadius(12)
                            .shadow(color: Color.orange.opacity(0.2), radius: 8, x: 0, y: 4)
                    }
                    .disabled(email.isEmpty)
                }
                .padding(.horizontal, 24)
                
                // Secondary Actions
                HStack {
                    Spacer()
                    Text("New to QuickDoc?")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Create Account")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                    Spacer()
                }
                .padding(.top, 12)
                
                Spacer()
            }
            .background(Color.white.ignoresSafeArea())
            .navigationDestination(isPresented: $navigateToList) {
                DoctorListView()
            }
        }
    }
}

#Preview {
    LoginView()
}
