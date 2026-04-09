//
//  AudioSliderComponent.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 27/02/2026.
//



import SwiftUI
import AVFoundation

struct AudioSliderComponent: View {

    // MARK: - Display
    let currentTimeText: String
    let remainingTimeText: String

    // MARK: - Progress
    @Binding var progress: CGFloat
    let waveProgress: CGFloat

    // MARK: - Audio
    let asset: AVURLAsset?

    // MARK: - Actions
    var onSeek: ((CGFloat) -> Void)?

    var body: some View {
        VStack(spacing: 10) {

            // Time Row
            HStack {
                MediumTextView(
                    key: currentTimeText,
                    fontSizeDelta: -4,
                    foregroundColor: .gray
                )

                Spacer()

                MediumTextView(
                    key: remainingTimeText,
                    fontSizeDelta: -4,
                    foregroundColor: .gray
                )
            }

            // Waveform + Slider
            ZStack {

                // Waveform
                Group {
                    if let asset {
                        AudioWave(
                            asset: asset,
                            progress: waveProgress
                        )
                    } else {
                        LoadingOverlay()
                    }
                }
                .frame(height: 40)

                // Slider
                CapsualSlider(
                    progress: $progress,
                    onSeek: onSeek
                )
                .padding(.top, 7)
            }
        }
    }
}

#Preview {

    struct PreviewWrapper: View {
        @State private var progress: CGFloat = 0.4

        var body: some View {
            AudioSliderComponent(
                currentTimeText: "01:24",
                remainingTimeText: "-03:12",
                progress: $progress,
                waveProgress: 0.4,
                asset: nil,
                onSeek: { value in
                    print("Seek to:", value)
                }
            )
            .padding()
            .background(Color.black)
        }
    }

    return PreviewWrapper()
}

