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
        ProgressBarWidgetEntry(date: Date(), progressType: .completed)
    }

    func getSnapshot(in context: Context, completion: @escaping (ProgressBarWidgetEntry) -> ()) {
        let entry = ProgressBarWidgetEntry(date: Date(), progressType: .completed)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
            let timeline: Timeline<ProgressBarWidgetEntry> = Util.createDayPercetageCompletionTimeline(currentDate: Date()) { date in
                ProgressBarWidgetEntry(date: date, progressType: .completed)
            }
            completion(timeline)
        }
    }
}

struct ProgressBarWidgetEntry: TimelineEntry, DayProgressViewProtocol {
    let date: Date
    let progressType: ProgressType
}

struct ProgressBarWidgetEntryView : View {
    var entry: ProgressBarWidgetProvider.Entry
    var body: some View {
        ProgressBar(date: entry.date, progressType: entry.progressType)
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
    ProgressBarWidgetEntry(date: Date() - 3600, progressType: .completed)
    ProgressBarWidgetEntry(date: Date(), progressType: .completed)
    ProgressBarWidgetEntry(date: Date() + 3600, progressType: .completed)
}

#Preview(as: .systemMedium) {
        ProgressBarWidget()
} timeline: {
    ProgressBarWidgetEntry(date: Date() - 3600, progressType: .remaining)
    ProgressBarWidgetEntry(date: Date(), progressType: .remaining)
    ProgressBarWidgetEntry(date: Date() + 3600, progressType: .remaining)
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
