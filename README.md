# 🩺 QUICKDOC

<p align="center">
<b>Book medical appointments in seconds.</b><br>
A clean SwiftUI demo app focused on a simple, modern appointment-booking experience.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-iOS-black?style=for-the-badge&logo=apple&logoColor=white"/>
  <img src="https://img.shields.io/badge/Language-Swift-F05138?style=for-the-badge&logo=swift&logoColor=white"/>
  <img src="https://img.shields.io/badge/UI-SwiftUI-0A84FF?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Architecture-MV--Style-6f42c1?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Status-Prototype-ff9500?style=for-the-badge"/>
</p>

---

## 🚀 Overview

QUICKDOC is a lightweight iOS prototype that simulates a healthcare booking journey:

1. Login with email  
2. Browse doctors  
3. Open a doctor profile and choose a time slot  
4. Confirm appointment and see success feedback  

The app is intentionally minimal, UI-first, and powered by local mock data.

---

## ✨ What QUICKDOC Does

- Provides a clean login entry screen (email required to continue)  
- Shows a scrollable list of doctors with rating and review count  
- Lets users view doctor details and available time slots  
- Enables selecting a slot and confirming an appointment  
- Displays a success alert after booking confirmation  
- Uses SwiftUI Navigation flow: **Login → Doctor List → Booking**

---


## 🛠️ Tech Stack

- **Language:** Swift  
- **UI Framework:** SwiftUI  
- **Architecture:** MV-style  
- **Navigation:** NavigationStack  
- **Data:** Local in-memory mock data (`MockData.swift`)

---

## 📂 Project Structure
QUICKDOC/
├── QUICKDOCApp.swift
├── LoginView.swift
├── DoctorListView.swift
├── BookingView.swift
├── Doctor.swift
├── MockData.swift
├── ContentView.swift
└── SCREENSHOTS/
├── LOGIN.png
├── DOCTOR_LIST.png
├── doctor_appointment.png
└── Appointement_Succesfull.png

## 📱 App Flow

| Login | Browse | Book | Confirm |
|------|--------|------|---------|
| ![](SCREENSHOTS/LOGIN.png) | ![](SCREENSHOTS/DOCTOR_LIST.png) | ![](SCREENSHOTS/doctor_appointment.png) | ![](SCREENSHOTS/Appointement_Succesfull.png) |



