//
//  DateView.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI

struct DateView: View {
    private let currentDate = Date()
    
    var body: some View {
        VStack(spacing: 0){
            
                Text(currentDate, format: .dateTime.weekday(.wide))
                    .font(.custom("Outfit", size: 18))
                    .fontWeight(.medium)
//                    .textCase(.lowercase)
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
//                    .border(Color.black)
                    .offset(x: 6, y: 28)
                
            
            Text(currentDate, format: .dateTime.day())
                .font(.custom("Outfit", size: 66))
                .fontWeight(.semibold)
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .offset(x: 6, y: 12)
//                .border(Color.black)
            
            Text(currentDate, format: .dateTime.month(.abbreviated))
                .font(.custom("Outfit", size: 66))
//                .textCase(.uppercase)
                .fontWeight(.semibold)
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .offset(x: 6, y: -16)
            
        }
        .frame(width: 141, height: 141)
//        .cornerRadius(4)
    }
    
    // Helper to format the date in "31 DEC" style
    private func formatDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM" // 31 DEC
        return formatter.string(from: date)
    }
}

@available(iOS 17.0, *)
#Preview {
    DateView()
}
