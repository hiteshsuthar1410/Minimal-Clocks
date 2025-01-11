//
//  MinimalClocksWidgetBundle.swift
//  MinimalClocksWidget
//
//  Created by Hitesh Suthar on 11/01/25.
//

import WidgetKit
import SwiftUI

@main
struct MinimalClocksWidgetBundle: WidgetBundle {
    var body: some Widget {
        MinimalClocksWidget()
        DayProgressCircleWidget()
        ProgressBarWidget()
    }
}
