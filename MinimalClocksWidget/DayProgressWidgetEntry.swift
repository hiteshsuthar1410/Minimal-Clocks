//
//  DayProgressWidgetEntry.swift
//  MinimalClocks
//
//  Created by NovoTrax Dev1 on 13/01/25.
//

import Foundation
import WidgetKit

struct DayProgressWidgetTimelineEntry: TimelineEntry, DayProgressViewProtocol {
    let date: Date
    let progressType: ProgressType
}
