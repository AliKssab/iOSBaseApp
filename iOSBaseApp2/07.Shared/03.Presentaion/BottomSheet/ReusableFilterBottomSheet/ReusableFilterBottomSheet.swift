//
//  ReusableFilterBottomSheet.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI

// MARK: - Protocol for any filter option
protocol FilterOptionProtocol: Identifiable, Hashable {
    var id: UUID { get }
    var label: String { get }
}

// MARK: - Generic Reusable Filter Bottom Sheet
struct ReusableFilterBottomSheet<Option: FilterOptionProtocol>: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedOption: Option?
    @State private var originalSelected: Option?
    
    let titleKey: String
    let clearButtonKey: String
    let confirmButtonKey: String
    let options: [Option]
    let initialSelected: Option?
    let onConfirm: (Option?) -> Void
    
    init(
        titleKey: String,
        clearButtonKey: String,
        confirmButtonKey: String,
        options: [Option],
        initialSelected: Option? = nil,
        onConfirm: @escaping (Option?) -> Void
    ) {
        self.titleKey = titleKey
        self.clearButtonKey = clearButtonKey
        self.confirmButtonKey = confirmButtonKey
        self.options = options
        self.initialSelected = initialSelected
        self.onConfirm = onConfirm
    }
    
    private var hasChanges: Bool {
           selectedOption != originalSelected
       }

       private var canClear: Bool {
           (selectedOption != nil) || (originalSelected != nil)
       }
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            ListSectionHeader(
                titleKey: titleKey,
                table: .doctorDetails,
                actionTextKey: clearButtonKey,
                actionTextColor: .subtitle,
                actionIsEnabled: canClear
            ) {
                selectedOption = nil
            }
            .padding(.top,50)
            
            // Option list
            VStack(spacing: 20) {
                ForEach(options) { option in
                    HStack(spacing: 12) {
                        SemiBoldTextView(key: option.label, fontSizeDelta: -2)
                        Spacer()
                        RadioCircle(isSelected: selectedOption == option)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedOption = option
                    }
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            // Confirm button
            SolidButton(
                key: confirmButtonKey,
                isEnabled: hasChanges
            ) {
                onConfirm(selectedOption)
                dismiss()
            }
            .padding(.bottom,40)
            .padding(.horizontal, 16)
        }
        .onAppear {
            if originalSelected == nil {
                           originalSelected = initialSelected
                           selectedOption  = initialSelected
                       }
        }
    }
}

// MARK: - Date Filter Option
struct DateFilterOption: FilterOptionProtocol {
    let id = UUID()
    let key: String
    
    var label: String {
        NSLocalizedString(key, comment: "")
    }
    
    static let last3Months = DateFilterOption(key: "filter_last_3_months".localized(from: .doctorDetails))
    static let last6Months = DateFilterOption(key: "filter_last_6_months".localized(from: .doctorDetails))
    static let last12Months = DateFilterOption(key: "filter_last_12_months".localized(from: .doctorDetails))
    
    var monthsBack: Int {
        switch self {
        case .last3Months: return 3
        case .last6Months: return 6
        case .last12Months: return 12
        default: return 0
        }
    }
}

extension DateFilterOption {
    static func from(monthsBack: Int?) -> DateFilterOption? {
        switch monthsBack {
        case 3:  return .last3Months
        case 6:  return .last6Months
        case 12: return .last12Months
        default: return nil
        }
    }
}


// MARK: - Sort Filter Option
struct SortFilterOption: FilterOptionProtocol {
    let id = UUID()
    let key: String
    
    var label: String {
        NSLocalizedString(key, comment: "")
    }
    
    static let lowToHighPrice = SortFilterOption(key: "sort_price_low_to_high".localized(from: .booking))
    static let highToLowPrice = SortFilterOption(key: "sort_price_high_to_low".localized(from: .booking))
    static let lowToHighRate  = SortFilterOption(key: "sort_rate_low_to_high".localized(from: .booking))
    static let highToLowRate  = SortFilterOption(key: "sort_rate_high_to_low".localized(from: .booking))
    
    var sortCode: String {
        switch self {
        case .lowToHighPrice: return "low_to_high_price"
        case .highToLowPrice: return "high_to_low_price"
        case .lowToHighRate:  return "low_to_high_rate"
        case .highToLowRate:  return "high_to_low_rate"
        default: return ""
        }
    }
    
    static func from(code: String?) -> SortFilterOption? {
        switch code {
            case "low_to_high_price": return .lowToHighPrice
            case "high_to_low_price": return .highToLowPrice
            case "low_to_high_rate":  return .lowToHighRate
            case "high_to_low_rate":  return .highToLowRate
            default: return nil
            }
        }
}

// MARK: - Sort Option
struct SortOption: FilterOptionProtocol {
    let id = UUID()
    let key: String
    var sortType: SortType
    
    var label: String {
        NSLocalizedString(key, comment: "")
    }
    
    enum SortType {
        case priceLowToHigh, priceHighToLow, ratingLowToHigh, ratingHighToLow
    }
    
    static let allOptions: [SortOption] = [
        SortOption(key: "sort_price_low_to_high".localized(from: .search), sortType: .priceLowToHigh),
        SortOption(key: "sort_price_high_to_low".localized(from: .search), sortType: .priceHighToLow),
        SortOption(key: "sort_rating_low_to_high".localized(from: .search), sortType: .ratingLowToHigh),
        SortOption(key: "sort_rating_high_to_low".localized(from: .search), sortType: .ratingHighToLow)
    ]
}

// MARK: - Sort Sheet for Sorting Options
struct SortFilterSheetView: View {
    let selectedCode: String?
    let onConfirm: (String?) -> Void
    
    var body: some View {
        ReusableFilterBottomSheet<SortFilterOption>(
            titleKey: "sort_by_title",
            clearButtonKey: "clear_all_button",
            confirmButtonKey: "btn_confirm_otp",
            options: [
                .lowToHighPrice,
                .highToLowPrice,
                .lowToHighRate,
                .highToLowRate
            ],
            initialSelected: SortFilterOption.from(code: selectedCode)
        ) { selectedOption in
            onConfirm(selectedOption?.sortCode)
        }
    }
}


// MARK: - Concrete Sheet for Date Filter
struct DateFilterSheetView: View {
    let initialMonthsBack: Int?
    let onConfirm: (Int?) -> Void

    var body: some View {
        ReusableFilterBottomSheet<DateFilterOption>(
            titleKey: "filter_by_date_title",
            clearButtonKey: "clear_all_button",
            confirmButtonKey: "btn_confirm_otp",
            options: [
                .last3Months,
                .last6Months,
                .last12Months
            ],
            initialSelected: DateFilterOption.from(monthsBack: initialMonthsBack) 
        ) { selectedOption in
            onConfirm(selectedOption?.monthsBack)
        }
    }
}

// MARK: - Concrete Sheet for Sort Filter
struct SortSheetView: View {
    let onConfirm: (SortOption.SortType?) -> Void
    
    var body: some View {
        ReusableFilterBottomSheet<SortOption>(
            titleKey: "sort_by_title",
            clearButtonKey: "clear_all_button",
            confirmButtonKey: "btn_confirm_otp",
            options: SortOption.allOptions
        ) { selectedOption in
            onConfirm(selectedOption?.sortType)
        }
    }
}
#Preview {
    SortSheetView(onConfirm: {_ in })
}
