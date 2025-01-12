//
//  ProgressBar.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI
struct ProgressBar: View, DayProgressViewProtocol {
    /*let startOfDay = Calendar.current.startOfDay(for: Date())*/
    var date: Date
    var progressType: ProgressType
    
    var body: some View {
        let percentOfDayCompleted = progressType == .completed ? Util.calculateDayCompletionPercentages(for: date).completed :
        Util.calculateDayCompletionPercentages(for: date).remaining
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text(progressType == .completed ? "Day Progress" : "Day Remaining")
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
            ProgressBarView(completedPercentage: Double(percentOfDayCompleted))
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
    Group {
        ProgressBar(date: Date(), progressType: .completed)
            .frame(width: 292, height: 141)
        ProgressBar(date: Date(), progressType: .remaining)
            .frame(width: 292, height: 141)
    }
}
