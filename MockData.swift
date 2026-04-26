import Foundation

struct MockData {
    static let doctors: [Doctor] = [
        Doctor(name: "Dr. Sarah Jenkins", specialty: "Cardiologist", rating: 4.9, reviewCount: 124, availableSlots: ["09:00 AM", "10:30 AM", "01:00 PM", "02:30 PM", "04:00 PM"]),
        Doctor(name: "Dr. Michael Chen", specialty: "Dermatologist", rating: 4.7, reviewCount: 89, availableSlots: ["10:00 AM", "11:30 AM", "03:00 PM"]),
        Doctor(name: "Dr. Emily Roberts", specialty: "Pediatrician", rating: 4.8, reviewCount: 210, availableSlots: ["08:30 AM", "09:45 AM", "11:00 AM", "01:30 PM"]),
        Doctor(name: "Dr. James Wilson", specialty: "Neurologist", rating: 4.6, reviewCount: 56, availableSlots: ["09:15 AM", "11:45 AM", "02:15 PM", "04:30 PM"])
    ]
}
