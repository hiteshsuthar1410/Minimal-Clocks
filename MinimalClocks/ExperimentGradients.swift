//
//  ExperimentGradients.swift
//  MinimalClocks
//
//  Created by NovoTrax Dev1 on 16/01/25.
import SwiftUI

struct GradientBackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var startColor: Color = .blue
    @State private var endColor: Color = .purple
    
    var body: some View {
        
        VStack {
            Spacer()
            
//            Text("Beautiful Gradient")
//                .font(.largeTitle)
//                .foregroundStyle(colorScheme == .dark ? .white : .black)
//                .bold()
//                .shadow(radius: 2)
            
            Spacer()
            
            Button(action: generateRandomGradient) {
                Text("Refresh Gradient")
//                    .fontWeight(.semibold)
//                    .padding()
//                    .background(Color.white.opacity(0.8))
//                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
//        .frame(height: 200)
        .cornerRadius(24)
        .padding()
        .background(.thinMaterial)
        .background(
            LinearGradient(gradient: Gradient(colors: [adjustForColorScheme(startColor), adjustForColorScheme(endColor)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    /// Generate a random gradient with harmonious colors.
    private func generateRandomGradient() {
        let randomColor = Color.random()
        let complementaryColor = randomColor.complementary()
        
        startColor = randomColor
        endColor = complementaryColor
    }
    
    /// Adjust color brightness for light/dark mode.
    private func adjustForColorScheme(_ color: Color) -> Color {
        colorScheme == .dark ? color.darker() : color.lighter()
    }
}

// MARK: - Color Extensions
extension Color {
    /// Generate a random color.
    static func random() -> Color {
        Color(red: Double.random(in: 0.3...1),
              green: Double.random(in: 0.3...1),
              blue: Double.random(in: 0.3...1))
    }
    
    /// Generate a complementary color.
    func complementary() -> Color {
        let components = UIColor(self).rgbaComponents
        return Color(red: 1 - components.red,
                     green: 1 - components.green,
                     blue: 1 - components.blue)
    }
    
    /// Lighten the color.
    func lighter(by amount: CGFloat = 0.3) -> Color {
        let components = UIColor(self).rgbaComponents
        return Color(red: min(components.red + amount, 1),
                     green: min(components.green + amount, 1),
                     blue: min(components.blue + amount, 1))
    }
    
    /// Darken the color.
    func darker(by amount: CGFloat = 0.3) -> Color {
        let components = UIColor(self).rgbaComponents
        return Color(red: max(components.red - amount, 0),
                     green: max(components.green - amount, 0),
                     blue: max(components.blue - amount, 0))
    }
}

extension UIColor {
    /// Extract RGBA components of a color.
    var rgbaComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}

//struct GradientBackgroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        GradientBackgroundView()
//            .preferredColorScheme(.light)
//        
//        GradientBackgroundView()
//            .preferredColorScheme(.dark)
//    }
//}

#Preview {
    GradientBackgroundView()
}

