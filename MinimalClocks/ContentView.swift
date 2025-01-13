//
//  ContentView.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    var columns = [
            GridItem(.flexible()), // First column
            GridItem(.flexible())  // Second column
        ]
    
    var column = [
            GridItem(.flexible()), // First column
        ]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                Text("Productivity")
                    .font(.custom("Outfit", size: 24))
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.1))
                        //                        .frame(width: 200, height: 200)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        DayProgressCircleView(date: Date(), progressType: .completed)
                    }
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.1))
                        //                        .frame(width: 200, height: 200)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        DayProgressCircleView(date: Date(), progressType: .remaining)
                    }
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.1))
                        //                        .frame(width: 200, height: 200)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        DayProgressCircleView(date: Date(), progressType: .remaining)
                    }
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.1))
                        //                        .frame(width: 200, height: 200)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        DayProgressCircleView(date: Date(), progressType: .completed)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
                
                Text("Productivity (Medium)")
                    .font(.custom("Outfit", size: 24))
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                
                LazyVGrid(columns: column, spacing: 16) {
                    
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        DayProgressBarView(date: Date(), progressType: .completed)
                    }
                    
                    
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 160)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        DayProgressBarView(date: Date(), progressType: .remaining)
                    }
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
