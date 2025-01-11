//
//  ProgressBarWidget.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI
import WidgetKit

struct ProgressBarWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> ProgressBarWidgetEntry {
        ProgressBarWidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (ProgressBarWidgetEntry) -> ()) {
        let entry = ProgressBarWidgetEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ProgressBarWidgetEntry] = []

        let fourteenMinutes: TimeInterval = 60 * 14 // 14 minutes in seconds
        let currentDate = Date()
        var nextDate = currentDate

        // Create 8 entries, each 14 minutes apart
        for _ in 1...8 {
            entries.append(ProgressBarWidgetEntry(date: nextDate))
            nextDate += fourteenMinutes
        }

        // Create the timeline with entries and specify the policy
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ProgressBarWidgetEntry: TimelineEntry {
    let date: Date
}

struct ProgressBarWidgetEntryView : View {
    var entry: ProgressBarWidgetProvider.Entry
    var body: some View {
        ProgressBar(date: entry.date)
    }
}


struct ProgressBarWidget: Widget {
    let kind: String = "ProgressBarWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ProgressBarWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                ProgressBarWidgetEntryView(entry: entry)
                    .containerBackground(Color.gray.opacity(0.2), for: .widget)
            } else {
                ProgressBarWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Day Progress in Percentage with current time")
        .description("Track the progress of the day in percentage to get the most out of it.")
    }
}

#Preview(as: .systemMedium) {
    ProgressBarWidget()
} timeline: {
    ProgressBarWidgetEntry(date: Date() - 3600)
    ProgressBarWidgetEntry(date: Date())
    ProgressBarWidgetEntry(date: Date() + 3600)
}

/*
struct ERW_Preview: PreviewProvider {
    static var previews: some View {
        ProgressBarWidgetEntryView(entry: .init(date: Date()))
            .containerBackground(for: .widget) {
                Color.clear
            }
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
*/
