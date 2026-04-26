import SwiftUI

struct DoctorListView: View {
    let doctors = MockData.doctors
    @State private var selectedCategory = "All"
    let categories = ["All", "Cardio", "Dental", "Skin", "Eyes"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Category Selector
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        CategoryChip(title: category, isSelected: selectedCategory == category) {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            .background(Color.white)
            
            // List Content
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(doctors) { doctor in
                        NavigationLink(destination: BookingView(doctor: doctor)) {
                            ProfessionalDoctorCard(doctor: doctor)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(20)
            }
        }
        .background(Color.secondary.opacity(0.05).ignoresSafeArea())
        .navigationTitle("Find a Specialist")
        #if os(iOS)
        .navigationBarBackButtonHidden(true)
        #endif
    }
}

struct CategoryChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(isSelected ? .white : .primary)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? Color.orange : Color.secondary.opacity(0.1))
                .cornerRadius(20)
        }
    }
}

struct ProfessionalDoctorCard: View {
    let doctor: Doctor
    
    var body: some View {
        HStack(spacing: 16) {
            // Profile Image Section
            ZStack {
                Circle()
                    .fill(Color.orange.opacity(0.1))
                    .frame(width: 64, height: 64)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.orange)
            }
            
            // Information Section
            VStack(alignment: .leading, spacing: 4) {
                Text(doctor.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(doctor.specialty)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                        .font(.caption)
                    
                    Text(String(format: "%.1f", doctor.rating))
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Text("(\(doctor.reviewCount) reviews)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 2)
            }
            
            Spacer()
            
            // Status/Action Section
            VStack(alignment: .trailing, spacing: 8) {
                Text("Available")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.orange)
                    .cornerRadius(6)
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    NavigationStack {
        DoctorListView()
    }
}
