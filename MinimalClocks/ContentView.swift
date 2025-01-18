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
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                        //                        .clipShape(Circle())
                            .padding(.horizontal)
                            
                    }
                    .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image("avatar_placeholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(.horizontal)
                    }
                }
//                           .shadow(radius: 10) // Optional shadow
                
                HStack {
                    Text("Hello,")
                        .foregroundStyle(.secondary)
                        .font(.custom("Outfit", size: 36))
                    
                    Text("Rohan")
                        .font(.custom("Outfit", size: 36))
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
                
                ScrollView(.horizontal) { // Horizontal scrolling
                    LazyHStack(spacing: 16) {
                        ForEach(1...10, id: \.self) { index in
                            PillButtonView()
                                
                            }
//                            .frame(width: 80, height: 100)
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
                        }
                    
                    .padding()
                }
                
                Text("Productivity")
                    .font(.custom("Outfit", size: 24))
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    Button {
                    } label: {
                        ZStack {
                            Rectangle().fill(Color.gray.opacity(0.1))
                            //                        .frame(width: 200, height: 200)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            
                            DayProgressCircleView(date: Date(), progressType: .completed)
                        }
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
                    
                    Button {
                    } label: {
                        ZStack {
                            Rectangle().fill(Color.gray.opacity(0.1))
                            //                        .frame(width: 200, height: 200)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            HStack {
                                Text("More Options please!")
                                Image(systemName: "chevron.right.circle")
                            }
                            //                        DayProgressCircleView(date: Date(), progressType: .completed)
                        }
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
@available(iOS 17.0, *)
#Preview {
    ContentView()
}

import SwiftUI

struct PillButtonView: View {
    @State private var isSelected = false

    var body: some View {
        Button(action: {
            isSelected.toggle() // Toggle selection state
        }) {
            Text("Pill Button")
                .font(.custom("Outfit", size: 12))
                .fontWeight(.regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 40)
                .background(isSelected ? Color.primary : Color.clear)
                .foregroundColor(isSelected ? Color.white : Color.primary)
                .clipShape(Capsule())
                .border(Color.pink)
                .overlay(
                    Capsule()
                        .stroke(Color.primary, lineWidth: 2)
                )
                .lineLimit(1)
            
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
//        .buttonStyle(BorderedProminentButtonStyle())
        .cornerRadius(24)
        .tint(Color.clear)
        
    }
}

struct PillButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PillButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
