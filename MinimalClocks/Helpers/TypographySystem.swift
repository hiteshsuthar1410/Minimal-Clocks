//
//  TypographySystem.swift
//  MinimalClocks
//
//  Created by Hitesh Suthar on 11/01/25.
//

import SwiftUI

enum FontType: String {
  case outfit
  
  var name: String {
    self.rawValue.capitalized
  }
}

enum FontWeight: String {
  case extraLight
  case light
  case thin
  case regular
  case medium
  case semiBold
  case bold
  case extraBold
  case black
  
  case extraLightItalic
  case lightItalic
  case thinItalic
  case regularItalic
  case mediumItalic
  case semiBoldItalic
  case boldItalic
  case extraBoldItalic
  case blackItalic
  
  var name: String {
    "-" + self.rawValue.capitalized
  }
}

@available(iOS 14, *)
extension Font {
  /// Use this method for custom fonts with variable weight and style.
  /// Dynamically updates the font size with the system size.
  /// - Parameters:
  ///   - type: Cases that describe the preferred type of font.
  ///   - weight: Cases that describe the preferred weight for fonts.
  ///   - style: Constants that describe the preferred styles for fonts.
  /// - Returns: Custom font based on the parameters you specified.
  static private func font(type: FontType, weight: FontWeight, style: UIFont.TextStyle) -> Font {
    .custom(type.name + weight.name, size: UIFont.preferredFont(forTextStyle: style).pointSize)
  }
  
  /// Use this method for custom fonts with variable weight and size.
  /// Dynamically updates the font size with the system size.
  /// - Parameters:
  ///   - type: Cases that describe the preferred type of font.
  ///   - weight: Cases that describe the preferred weight for fonts.
  ///   - size: Constants that describe the preferred size for fonts.
  /// - Returns: Custom font based on the parameters you specified.
  static private func font(type: FontType, weight: FontWeight, size: CGFloat) -> Font {
    .custom(type.name + weight.name, size: size)
  }
}

@available(iOS 14, *)
extension Font {
  
  /// A font with the large title text style.
  static let appLargeTitle = font(type: .outfit, weight: .bold, style: .largeTitle)
  
  /// A font with the title text style.
  static let appTitle = font(type: .outfit, weight: .bold, style: .title1)
  
  /// A font for second level hierarchical headings.
  static let appSecondaryTitle = font(type: .outfit, weight: .bold, style: .title2)
  
  /// A font for third level hierarchical headings.
  static let appTertiaryTitle = font(type: .outfit, weight: .bold, style: .title3)
  
  /// A font with the headline text style.
  static let appHeadline = font(type: .outfit, weight: .bold, style: .headline)
  
  /// A font with the body text style.
  static let appBody = font(type: .outfit, weight: .regular, style: .body)

  /// A font with the callout text style.
  static let appCallout = font(type: .outfit, weight: .regular, style: .callout)
  
  /// A font with the caption text style.
  static let appCaption = font(type: .outfit, weight: .regular, style: .caption1)
  
  /// A font with the credits text style.
  static let appCredits = font(type: .outfit, weight: .light, style: .caption2)
}
