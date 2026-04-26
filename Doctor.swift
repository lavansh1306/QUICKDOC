import Foundation

struct Doctor: Identifiable, Hashable {
    let id: UUID
    let name: String
    let specialty: String
    let rating: Double
    let reviewCount: Int
    let availableSlots: [String]
    
    init(id: UUID = UUID(), name: String, specialty: String, rating: Double, reviewCount: Int, availableSlots: [String]) {
        self.id = id
        self.name = name
        self.specialty = specialty
        self.rating = rating
        self.reviewCount = reviewCount
        self.availableSlots = availableSlots
    }
}
