//
//  DayProgressCircleWidget.swift
//  MinimalClocksWidgetExtension
//
//  Created by NovoTrax Dev1 on 11/01/25.
//

import SwiftUI
import WidgetKit

struct DayProgressCircleWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> DayProgressCircleWidgetEntry {
        DayProgressCircleWidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (DayProgressCircleWidgetEntry) -> ()) {
        let entry = DayProgressCircleWidgetEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayProgressCircleWidgetEntry] = []

        let fourteenMinutes: TimeInterval = 60 * 14 // 14 minutes in seconds
        let currentDate = Date()
        var nextDate = currentDate

        // Create 8 entries, each 14 minutes apart
        for _ in 1...8 {
            entries.append(DayProgressCircleWidgetEntry(date: nextDate))
            nextDate += fourteenMinutes
        }

        // Create the timeline with entries and specify the policy
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct DayProgressCircleWidgetEntry: TimelineEntry {
    let date: Date
}

struct DayProgressCircleWidgetEntryView : View {
    var entry: DayProgressCircleWidgetProvider.Entry
    var body: some View {
        DayProgressCircleView(date: entry.date)
    }
}


struct DayProgressCircleWidget: Widget {
    let kind: String = "DayProgressCircleWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: DayProgressCircleWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                DayProgressCircleWidgetEntryView(entry: entry)
                    .containerBackground(Color.gray.opacity(0.2), for: .widget)
            } else {
                DayProgressCircleWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Day Progress in Percentage with current time in Circle")
        .description("Track the progress of the day in percentage to get the most out of it.")
    }
}

#Preview(as: .systemSmall) {
    DayProgressCircleWidget()
} timeline: {
    DayProgressCircleWidgetEntry(date: Date() - 3600)
    DayProgressCircleWidgetEntry(date: Date())
    DayProgressCircleWidgetEntry(date: Date() + 3600)
}
