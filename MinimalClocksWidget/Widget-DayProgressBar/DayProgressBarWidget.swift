//
//  DayProgressBarWidget.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI
import WidgetKit

struct DayProgressBarWidgetProvider: IntentTimelineProvider {
    
    typealias Entry = DayProgressWidgetTimelineEntry
    typealias Intent = ProgressTypeSelectionIntent
    
    func placeholder(in context: Context) -> DayProgressWidgetTimelineEntry {
        DayProgressWidgetTimelineEntry(date: Date(), progressType: .completed)
    }
    
    func getSnapshot(for configuration: ProgressTypeSelectionIntent, in context: Context, completion: @escaping (DayProgressWidgetTimelineEntry) -> Void) {
        let selection = Util.progreessType(for: configuration)
        let entry = DayProgressWidgetTimelineEntry(date: Date(), progressType: selection)
        completion(entry)
    }
    
    func getTimeline(for configuration: ProgressTypeSelectionIntent, in context: Context, completion: @escaping (Timeline<DayProgressWidgetTimelineEntry>) -> Void) {
        let selection = Util.progreessType(for: configuration)
        let timeline: Timeline<DayProgressWidgetTimelineEntry> = Util.createDayPercetageCompletionTimeline(currentDate: Date()) { date in
            DayProgressWidgetTimelineEntry(date: date, progressType: selection)
        }
        completion(timeline)
    }
}



struct DayProgressBarWidgetEntryView : View {
    var entry: DayProgressBarWidgetProvider.Entry
    var body: some View {
        DayProgressBarView(date: entry.date, progressType: entry.progressType)
    }
}

struct DayProgressBarWidget: Widget {
    
    let kind: String = "DayProgressBarWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ProgressTypeSelectionIntent.self, provider: DayProgressCircleWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                DayProgressBarWidgetEntryView(entry: entry)
                    .containerBackground(Color.gray.opacity(0.2), for: .widget)
            } else {
                DayProgressBarWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Day Elapsed/Remaining in Bar")
        .description("Track your day to get the most out of it.")
    }
}

#Preview(as: .systemMedium) {
        DayProgressBarWidget()
} timeline: {
    DayProgressWidgetTimelineEntry(date: Date() - 3600, progressType: .completed)
    DayProgressWidgetTimelineEntry(date: Date(), progressType: .completed)
    DayProgressWidgetTimelineEntry(date: Date() + 3600, progressType: .completed)
}

/*
struct ERW_Preview: PreviewProvider {
    static var previews: some View {
        DayProgressBarWidgetEntryView(entry: .init(date: Date()))
            .containerBackground(for: .widget) {
                Color.clear
            }
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
*/
