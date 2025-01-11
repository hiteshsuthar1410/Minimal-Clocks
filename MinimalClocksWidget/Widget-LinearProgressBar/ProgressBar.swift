//
//  ProgressBar.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI
struct ProgressBar: View {
    /*let startOfDay = Calendar.current.startOfDay(for: Date())*/
    var date: Date
    private var percentOfDayCompleted: Double {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let secondsSinceMidnight = date.timeIntervalSince(startOfDay)
        let totalSecondsInDay = 24 * 60 * 60
        return (secondsSinceMidnight / Double(totalSecondsInDay)) * 100
    }
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Day Progress")
                        .font(.custom("Outfit", size: 12))
                        .foregroundStyle(Color.indigoPrimary)
                        .offset(y: 12)
                    Text("\(Int(percentOfDayCompleted))%")
                        .font(.custom("Outfit", size: 70))
                        .foregroundStyle(Color.indigoPrimary)
                }
                
                Spacer()
                
                /*
                Text(startOfDay, style: .timer)
                    .frame(alignment: .trailing)
                    .padding(.vertical, 6)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 24).fill(Color.OrangeSecondary))
                 */
            }
            ProgressBarView(completedPercentage: percentOfDayCompleted)
                .offset(y: -6)
        }
        .padding(.horizontal, 6)
    }
}

struct ProgressBarView: View {
    let completedPercentage: Double // Percentage of the day completed
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                // Rear bar: Background for the entire day
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orangeSecondary) // Background color
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orangePrimary)
                    .offset(x: -geo.size.width + ((geo.size.width * completedPercentage) / 100))
                    .animation(.easeInOut, value: completedPercentage)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
        }
        .frame(height: 8)
    }
}


#Preview {
    ProgressBar(date: Date())
        .frame(width: 292, height: 141)
}
