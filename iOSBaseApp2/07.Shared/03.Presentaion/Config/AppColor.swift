//
//  AppColor.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 25/05/2025.
//


import SwiftUI
import UIKit

enum AppColor: CaseIterable, Hashable {
    case clear
    case white
    case black
    case primaryPurple
    case softPurple
    case palePurple
    case backgroundSoftLavender
    case backgroundGray
    case darkGray
    case whiteGray
    case lightGray
    case subtitle
    case pureBlack
    case pureWhite
    case separatorGray
    case iconBorderBlueGray
    case deepVioletBlack
    case inputFieldIcon
    case inputValidationErrorRed
    case inputSeparatorGray
    case countryCodeBlueGray
    case optionalLabelBlueGray
    case underlineTextDarkBlue
    case alertErrorBackgroundYellow
    case alertTextOrange
    case darkCyan
    case darkRed
    case goldenYellow
    case springGreen
    case successGreen
    case caramelOrange
    case paleCyan
    case statusConfirmedText
    case statusConfirmedBackground
    case lightRed
    case facebookBlue10Opacity
    case instagramOrange10Opacity
    case youtubeRed10Opacity
    case twitterBlue10Opacity
    case shareIconDark10Opacity
    case gmailRed10Opacity
    case phoneBlue10Opacity
    case whatsappGreen10Opacity
    case textSteelBlue
    case backgroundLightGray
    case backgroundLightWhit
    case lavenderGrayLight
    case lightPink
    case brown
    case lightPurple
    case paleLilac
    case titlegray
    case borderRed
    case deepTeal
    case lightdeepTeal
    case darkblack
    case lightblack
    case softPink
    case graydark
    case altraBlure
    case thinGray
    case lightGray2
    case darkCrimson
    case lightgreen
    case lightGray3
    case lightred
    case darkBlur
    case Oxblood
    case blackGray
    case deepRed
    case darkGarnet
    case  nearBlack
    case lietManColer
    case mainLiet
    case bloLiet
    case gray
    case graySubtitle
    case babyBlue
    case maniLietLight
    case mintGray
    case lightGray4
    case yellow
    case green
    case red
    case regularGray
    case lietGray
    case volientGray
    case borderViolent
    var hexValue: String {
        switch self {
        case .green: return "#19AF66"
        case .mintGray: return "#00004C"
        case .lightGray4: return "#F0F0F4"
        case .clear: return "#00000000"
        case .white: return "#ffffff"
        case .black: return "#000000"
        case .primaryPurple: return "#00004C"
        case .softPurple: return "#8f74b3"
        case .palePurple: return "#F0ECF5"
        case .backgroundGray: return "#E6E6E6"
        case .darkGray: return "#666666"
        case .lightGray: return "#FAFAFA"
        case .whiteGray: return "#F5F7F9"
        case .pureBlack: return "#000000"
        case .pureWhite: return "#FFFFFF"
        case .separatorGray: return "#E6E6E6"
        case .iconBorderBlueGray: return "#7E94B0"
        case .deepVioletBlack: return "#251836"
        case .subtitle: return "#47586E"
        case .inputFieldIcon: return "#7E94B0"
        case .inputValidationErrorRed: return "#ED1C24"
        case .inputSeparatorGray: return "#D9DBE9"
        case .countryCodeBlueGray: return "#7E94B0"
        case .optionalLabelBlueGray: return "#7E94B0"
        case .underlineTextDarkBlue: return "#3D4C5E"
        case .alertErrorBackgroundYellow: return "#FFFAEB"
        case .alertTextOrange: return "#DC6803"
        case .backgroundSoftLavender: return "#F8F6FA"
        case .darkRed: return "#C54B4B"
        case .goldenYellow: return "#FFC107"
        case .springGreen: return "#98D642"
        case .successGreen: return "#03A853"
        case .caramelOrange: return "#DC8151"
        case .darkCyan: return "#006F98"
        case .paleCyan: return "#E5F1F5"
        case .statusConfirmedText: return "#50C878"
        case .statusConfirmedBackground: return "#EFF9F2"
        case .lightRed: return "#FAE8E9"
        case .facebookBlue10Opacity: return "#1877F21A"
        case .instagramOrange10Opacity: return "#FA99051A"
        case .youtubeRed10Opacity: return "#FF40401A"
        case .twitterBlue10Opacity: return "#03A9F41A"
        case .shareIconDark10Opacity: return "#27334B1A"
        case .gmailRed10Opacity: return "#FF00001A"
        case .phoneBlue10Opacity: return "#03A9F41A"
        case .whatsappGreen10Opacity: return "#03A8531A"
        case .textSteelBlue: return "#546881"
        case .backgroundLightGray: return "#0000004D"
        case .backgroundLightWhit: return "#E9E3F0"
        case .lavenderGrayLight: return "#E9EBF8"
        case .softPink: return "#FEF4F4"
        case .lightPink: return "#FFE5E5"
        case .brown: return "#1A0304"
        case .lightPurple: return "#FEF4F4"
        case .paleLilac : return "#DCDCE4"
        case .titlegray : return "#60717F"
        case .borderRed : return "#FCDBDC"
        case .deepTeal: return "#009096"
        case .darkblack: return "#130918"
        case .lightblack: return "#1D242D"
        case .graydark: return "#656B78"
        case .altraBlure: return "#FFFFFF1A"
        case .thinGray : return "#909DAD"
        case .lightGray2 : return "#F0F1F4"
        case .darkCrimson: return "#8F090E"
        case .lightgreen:return "#50C8781A"
        case .lightGray3 : return "#ADADAD1A"
        case .lightred : return "#FEF9F9"
        case .darkBlur : return "#00000033"
        case .Oxblood: return "#3B0709"
        case .lightdeepTeal: return "#0090961A"
        case .blackGray : return"#4F4F4F"
        case .deepRed: return "#800F14"
        case .darkGarnet:  return "#3A0709"
        case .nearBlack:  return "#1A0304"
        case .lietManColer: return "#BBAFD0"
        case .mainLiet: return "#E8E3EF"
        case .bloLiet: return "#EEF5FF"
        case .gray: return "#ECECED"
        case .graySubtitle: return "#606673"
        case .babyBlue : return "#E6EAF2"
        case .maniLietLight: return "#F1F1F8"
        case .yellow : return "#FCE38E"
        case .red: return "#FF0005"
        case .regularGray: return "#8E8E93"
        case .lietGray: return "#F0F0F6"
        case .volientGray: return "#8E8EA9"
        case .borderViolent: return "#E9E8F8"
        }
    }
    
    var color: Color {
        if self == .clear { return Color.clear }
        return Color(hex: self.hexValue)
    }
}


extension Color {
    
    static func appColor(_ name: AppColor) -> Color {
        return Color(hex: name.hexValue)
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b, a: Double
        switch hex.count {
        case 8:
                   r = Double((int >> 24) & 0xFF) / 255
                   g = Double((int >> 16) & 0xFF) / 255
                   b = Double((int >> 8) & 0xFF) / 255
                   a = Double(int & 0xFF) / 255
        case 6:
            r = Double((int >> 16) & 0xFF) / 255
            g = Double((int >> 8) & 0xFF) / 255
            b = Double(int & 0xFF) / 255
            a = 1
        default:
            r = 0
            g = 0
            b = 0
            a = 1
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
}


extension UIColor {
    static func appColor(_ color: AppColor) -> UIColor {
        return UIColor(color.color)
    }
}
