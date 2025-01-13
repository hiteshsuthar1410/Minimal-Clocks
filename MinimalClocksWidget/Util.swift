//
//  Util.swift
//  MinimalClocks
//
//  Created by NovoTrax Dev1 on 12/01/25.
//

import WidgetKit
struct Util {
    
    private init() {}
    
    static func createDayPercetageCompletionTimeline<T: TimelineEntry>(currentDate: Date,numberOfEntries: Int = 8, entryBuilder: (Date) -> T) -> Timeline<T> {
        var entries: [T] = []
        let blockDuration: TimeInterval = 864 // Each block is 864 seconds
        let _: TimeInterval = 86400 // Total seconds in a day
        
        // Calculate the remainder time left in the current block
        let secondsSinceMidnight = Calendar.current.dateComponents([.second], from: Calendar.current.startOfDay(for: currentDate), to: currentDate).second ?? 0
        let elapsedInCurrentBlock = TimeInterval(secondsSinceMidnight).truncatingRemainder(dividingBy: blockDuration)
        let remainingInCurrentBlock = blockDuration - elapsedInCurrentBlock
        
        // First entry: Complete the remaining time in the current block
        var nextDate = currentDate.addingTimeInterval(remainingInCurrentBlock)
        entries.append(entryBuilder(nextDate))
        
        // Generate subsequent entries, spaced 864 seconds apart
        for _ in 1..<numberOfEntries {
            nextDate = nextDate.addingTimeInterval(blockDuration)
            entries.append(entryBuilder(nextDate))
        }
        
        // Create the timeline
        return Timeline(entries: entries, policy: .atEnd)
    }

    static func calculateDayCompletionPercentages(for date: Date) -> (completed: Int, remaining: Int) {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date) // Midnight of the current day
        let totalSecondsInDay: TimeInterval = 86400 // Total seconds in a day
        
        // Seconds elapsed since the start of the day
        let secondsElapsed = date.timeIntervalSince(startOfDay)
        
        // Percentage completed
        let completedPercentage = (secondsElapsed / totalSecondsInDay) * 100
        
        // Percentage remaining
        let remainingPercentage = 100 - Int(completedPercentage)
        
        return (completed: Int(completedPercentage), remaining: remainingPercentage)
    }
    
    static func progreessType(for config: ProgressTypeSelectionIntent) -> ProgressType {
        switch config.Progress {
        case .elapsed:
                return .completed
        case .remaining:
            return  .remaining
            
        default:
            return .completed
        }
    }
}
