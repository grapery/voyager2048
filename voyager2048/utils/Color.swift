//
//  Color.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/9.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    let primaryButtonBackgroundColor = Color("PrimaryButtonBackgroundColor")
    let primaryButtonForegroundColor = Color("PrimaryButtonForegroundColor")
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
