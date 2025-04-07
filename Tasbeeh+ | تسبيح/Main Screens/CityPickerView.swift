//
//  CityPickerView.swift
//  Tasbeeh+ | تسبيح
//
//  Created by A Sky on 16/09/1446 AH.
//

/*import Foundation
import SwiftUI
import Adhan

struct CityPickerView: View {
    @Binding var selectedCity: City?
    @ObservedObject var prayerManager: PrayerTimesManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(saudiCities, id: \.id) { city in
                Button(action: {
                    selectedCity = city
                    prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text(city.name)
                            .font(.headline)
                        Spacer()
                        if selectedCity == city {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("اختر مدينة")
            .navigationBarItems(trailing: Button("إغلاق") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}*/
import SwiftUI
import Adhan
import Foundation

struct CityPickerView: View {
    @Binding var selectedCity: City?
    @ObservedObject var prayerManager: PrayerTimesManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(saudiCities, id: \.id) { city in
                Button(action: {
                    selectedCity = city
                    prayerManager.fetchPrayerTimes(latitude: city.latitude, longitude: city.longitude)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text(city.name)
                            .font(.headline)
                        Spacer()
                        if selectedCity == city {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("اختر مدينة")
            .navigationBarItems(trailing: Button("إغلاق") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


