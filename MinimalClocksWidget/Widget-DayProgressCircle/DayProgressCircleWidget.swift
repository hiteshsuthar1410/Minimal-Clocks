//
//  DayProgressCircleWidget.swift
//  MinimalClocksWidgetExtension
//
//  Created by NovoTrax Dev1 on 11/01/25.
//

import SwiftUI
import WidgetKit

struct DayProgressCircleWidgetProvider: IntentTimelineProvider {
    
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


struct DayProgressWidgetTimelineEntryView : View {
    var entry: DayProgressCircleWidgetProvider.Entry
    var body: some View {
        DayProgressCircleView(date: entry.date, progressType: entry.progressType)
    }
}


struct DayProgressCircleWidget: Widget {
    
    let kind: String = "DayProgressCircleWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ProgressTypeSelectionIntent.self, provider: DayProgressCircleWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                DayProgressWidgetTimelineEntryView(entry: entry)
                    .containerBackground(Color.gray.opacity(0.2), for: .widget)
            } else {
                DayProgressWidgetTimelineEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Day Elapsed/Remaining in Circle")
        .description("Track your day to get the most out of it.")
    }
}

@available(iOS 17.0, *)
#Preview(as: .systemSmall) {
    DayProgressCircleWidget()
} timeline: {
    DayProgressWidgetTimelineEntry(date: Date() - 3600, progressType: .completed)
    DayProgressWidgetTimelineEntry(date: Date(), progressType: .completed)
    DayProgressWidgetTimelineEntry(date: Date() + 3600, progressType: .completed)
}
