//
//  RateAppointmentSheetView.swift
//  AseerAlKotobSwiftUI
//
//  Created by Sana on 16/09/2025.
//


import SwiftUI
import Cosmos
//
//struct RateAppointmentSheetView: View {
//    
//    // MARK: - ViewModel & State
//     @State private var rating: Double = 4.0
//    @State private var comment: String = ""
//    @FocusState private var isFocused: Bool
//    @Environment(\.dismiss) private var dismiss
//    let doctorId:Int
//    let appointmentId:Int
//    let userImageUrl: String?
//    var onRated: (() -> Void)? = nil
// 
//    
//    // MARK: - Body
//    var body: some View {
//        
//        BackgroundStatusBar {_ in
//            contentView()
//        }
//        .task {
//            await viewModel.fetchQuickComments()
//        }
//    }
//}

// MARK: - Private Views

//private extension RateAppointmentSheetView {
//    
//    // MARK: - Main Content View
//    @ViewBuilder
//    private func contentView() -> some View {
//        switch viewModel.stateQuickComments {
//        case .idle, .loading:
//            Color.clear
//        case .error(let message):
//            Text("Error: \(message)")
//                .foregroundColor(.red)
//        case .success(let data):
//            rateData(data)
//        }
//        
//        switch viewModel.stateRate  {
//        case .idle, .loading:
//            Color.clear
//        case .error(let message):
//            Text("Error: \(message)")
//                .foregroundColor(.red)
//        case .success(()):
//            successRate()
//        }
//    }
//    
//    // MARK: - Success Rate View
//    private func successRate() -> some View {
//        VStack {
//             Color.clear
//                 .onAppear {
//                     onRated?()
//                     dismiss()
//                 }
//         }
//    }
//    
//    // MARK: - Rate Data View
//    private func rateData(_ model: [QuickCommentResponse]) -> some View {
//        VStack(alignment: .center,spacing: 25) {
//            
//            // MARK: Title and Subtitle
//            TitleSubtitleView(
//                titleKey: "add_doctor_rating_title",
//                subtitleKey: "add_doctor_rating_subtitle",
//                table: .shared,
//                textAlignment: .center
//            )
//            
//             LineSeparator()
//            
//            // MARK: Rating Stars
//            HStack {
//                Spacer()
//                CosmosRatingRepresentable(rating: $rating)
//                    .frame(width: 26 * 5 + 15 * 4, height: 30)
//                Spacer()
//            }
//            .padding(.vertical, 5)
//            
//             LineSeparator()
//            
//            // MARK: Quick Reply Tags
//            HorizontalTagSelectorSection(
//                titleKey: "quick_replies_title",
//                table: .shared,
//                tags: model,
//                selectedTag: Binding(
//                    get: { comment },
//                    set: { newValue in
//                        comment = newValue?.localized(from: .shared) ?? ""
//                    }
//                )
//            )
//            .padding(.leading, 16)
//           
//        }
//        .padding(.top, 24)
//    }
//}

// MARK: - Cosmos View Wrapper
struct CosmosRatingRepresentable: UIViewRepresentable {
    @Binding var rating: Double
    
    func makeUIView(context: Context) -> CosmosView {
        let view = CosmosView()
        view.settings.totalStars = 5
        view.settings.fillMode = .half
        view.settings.updateOnTouch = true
        view.settings.starSize = 26
        view.settings.starMargin = 15
        view.settings.filledImage = UIImage(named: "ic_star_fill")
        view.settings.emptyImage = UIImage(named: "ic_star")
        view.didTouchCosmos = { value in
            rating = value
        }
        return view
    }
    
    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating
    }
}
