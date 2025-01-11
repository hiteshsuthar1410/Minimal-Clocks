//
//  MinimalClocksWidget.swift
//  MinimalClocksWidget
//
//  Created by Hitesh Suthar on 11/01/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let currentDate = Date()
        
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current // Adjust to local timezone
        let nextMidnight = calendar.nextDate(after: currentDate, matching: DateComponents(hour: 0), matchingPolicy: .nextTime)!
        
        // Create the timeline
        let entry = SimpleEntry(date: currentDate)
        let timeline = Timeline(entries: [entry], policy: .after(nextMidnight))
        
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct MinimalClocksWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        DateView()
    }
}

struct MinimalClocksWidget: Widget {
    let kind: String = "MinimalClocksWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MinimalClocksWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MinimalClocksWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Day Date Month")
        .description("Day Date Month in abbrivated style.")
    }
}

#Preview(as: .systemSmall) {
    MinimalClocksWidget()
} timeline: {
    SimpleEntry(date: .now)
    SimpleEntry(date: .now + 86400)
}
