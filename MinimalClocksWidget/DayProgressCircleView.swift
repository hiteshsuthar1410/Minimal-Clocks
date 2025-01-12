//
//  DayProgressCircleView.swift
//  MinimalClocksWidgetExtension
//
//  Created by NovoTrax Dev1 on 11/01/25.
//

import SwiftUI
struct DayProgressCircleView: View, DayProgressViewProtocol {
    let date: Date
    let progressType: ProgressType
    
    var body: some View {
        let percentOfDayCompleted = progressType == .completed ? Util.calculateDayCompletionPercentages(for: date).completed :
        Util.calculateDayCompletionPercentages(for: date).remaining
        
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
            Text(progressType == .completed ? "Day Progress" : "Day Remaining")
                .font(.custom("Outfit", size: 12))
                .foregroundStyle(Color.indigoPrimary)
                .frame(maxWidth: .infinity)
        }
        .offset(y: 3)
        .frame(width: 141, height: 141, alignment: .center)
    }
}

struct DayProgressCircle: View {
    let completedPercentage: Int // Percentage of the day completed
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 10)
                .foregroundStyle(Color.orangeSecondary)
                .rotationEffect(Angle(degrees: 270.0))
            
            Circle()
                .trim(from: 0.0, to: (CGFloat(completedPercentage)/100))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundStyle(Color.orangePrimary)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}


#Preview {
    Group {
        DayProgressCircleView(date: Date(), progressType: .completed)
            .frame(width: 141, height: 141)
        
        DayProgressCircleView(date: Date(), progressType: .remaining)
            .frame(width: 141, height: 141)
    }
}


protocol DayProgressViewProtocol {
    var date: Date { get }
    var progressType: ProgressType { get }
}

enum ProgressType {
    case remaining, completed
}
