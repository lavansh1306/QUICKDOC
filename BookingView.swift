import SwiftUI

struct BookingView: View {
    let doctor: Doctor
    @State private var selectedSlot: String? = nil
    @State private var showAlert = false
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Hero Header
                    HStack(spacing: 20) {
                        ZStack {
                            Circle()
                                .fill(Color.orange.opacity(0.1))
                                .frame(width: 80, height: 80)
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.orange)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(doctor.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(doctor.specialty)
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            HStack(spacing: 12) {
                                Label("\(doctor.rating, specifier: "%.1f")", systemImage: "star.fill")
                                    .foregroundColor(.orange)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                
                                Label("\(doctor.reviewCount) Reviews", systemImage: "message.fill")
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    
                    // Bio Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About Doctor")
                            .font(.headline)
                        
                        Text("\(doctor.name) is a highly experienced \(doctor.specialty.lowercased()) dedicated to providing personalized care and expert medical advice to patients.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal, 24)
                    
                    Divider()
                        .padding(.horizontal, 24)
                    
                    // Slots Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Select Appointment Time")
                            .font(.headline)
                            .padding(.horizontal, 24)
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(doctor.availableSlots, id: \.self) { slot in
                                Button(action: {
                                    selectedSlot = slot
                                }) {
                                    Text(slot)
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(selectedSlot == slot ? .white : .primary)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(selectedSlot == slot ? Color.orange : Color.secondary.opacity(0.08))
                                        .cornerRadius(10)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                }
                .padding(.bottom, 120)
            }
            
            // Anchored Action Bar
            VStack {
                Button(action: {
                    if selectedSlot != nil {
                        showAlert = true
                    }
                }) {
                    Text("Confirm Appointment")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(selectedSlot == nil ? Color.orange.opacity(0.5) : Color.orange)
                        .cornerRadius(12)
                        .shadow(color: selectedSlot == nil ? .clear : Color.orange.opacity(0.2), radius: 10, x: 0, y: 5)
                }
                .disabled(selectedSlot == nil)
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 34)
            }
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: -5)
        }
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("Booking")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Booking Successful"),
                message: Text("Your appointment with \(doctor.name) is confirmed for \(selectedSlot ?? "")."),
                dismissButton: .default(Text("Done"))
            )
        }
    }
}

#Preview {
    NavigationStack {
        BookingView(doctor: MockData.doctors[0])
    }
}
