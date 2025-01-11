//
//  DayProgressCircleView.swift
//  MinimalClocksWidgetExtension
//
//  Created by NovoTrax Dev1 on 11/01/25.
//

import SwiftUI
struct DayProgressCircleView: View {
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
        VStack(spacing: 6) {
            ZStack {
                DayProgressCircle(completedPercentage: percentOfDayCompleted)
                
                HStack(spacing: 0) {
                    Text("\(Int(percentOfDayCompleted))")
                        .font(.custom("Outfit", size: 60))
                        .foregroundStyle(Color.indigoPrimary)
                        
                    Text("%")
                        .foregroundStyle(Color.indigoPrimary)
                }
            }
            Text("Day Progress")
                .font(.custom("Outfit", size: 12))
                .foregroundStyle(Color.indigoPrimary)
                .frame(maxWidth: .infinity)
            
        }
        .offset(y: 3)
        .frame(width: 141, height: 141, alignment: .center)
    }
}

struct DayProgressCircle: View {
    let completedPercentage: Double // Percentage of the day completed
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 10)
                .foregroundStyle(Color.orangeSecondary)
                .rotationEffect(Angle(degrees: 270.0))
            
            Circle()
                .trim(from: 0.0, to: completedPercentage/100)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundStyle(Color.orangePrimary)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}


#Preview {
    DayProgressCircleView(date: Date())
        .frame(width: 141, height: 141)
}
