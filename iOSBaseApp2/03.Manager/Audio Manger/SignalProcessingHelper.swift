//
//  SignalProcessingHelper.swift
//  Sound
//
//  Created by Sanour on 03/02/2026.
//

import Foundation
import AVFoundation
import Accelerate

struct AudioInfo {
    let sampleRate: Double
    let duration: Double
    let samples: [Float]
}

enum SignalProcessingHelper {

    static func samples(_ asset: AVURLAsset) throws -> AudioInfo {
        let audio = try AVAudioFile(forReading: asset.url)

        guard let buffer = AVAudioPCMBuffer(
            pcmFormat: audio.processingFormat,
            frameCapacity: UInt32(audio.length)
        ) else {
            throw NSError(domain: "AudioBuffer", code: -1)
        }

        try audio.read(into: buffer)

        guard let channel = buffer.floatChannelData?[0] else {
            throw NSError(domain: "ChannelData", code: -1)
        }

        let samples = Array(
            UnsafeBufferPointer(
                start: channel,
                count: Int(buffer.frameLength)
            )
        )

        return AudioInfo(
            sampleRate: audio.processingFormat.sampleRate,
            duration: Double(audio.length) / audio.processingFormat.sampleRate,
            samples: samples
        )
    }

    static func downsample(_ samples: [Float], count: Int) -> [Float] {
        guard !samples.isEmpty, count > 0 else { return [] }

        let chunkSize = samples.count / count
        var result = [Float](repeating: 0, count: count)

        samples.withUnsafeBufferPointer { buffer in
            for i in 0..<count {
                let start = i * chunkSize
                let end = min(start + chunkSize, samples.count)
                if start < end {
                    result[i] = vDSP.maximum(buffer[start..<end])
                }
            }
        }

        return result
    }
}
import SwiftUI

struct AudioWaveShape: Shape {

    let samples: [Float]
    let spacing: CGFloat
    let barWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        Path { path in
            var x: CGFloat = 0

            for sample in samples {
                let normalized = max(CGFloat(sample), 0.05)
                let height = normalized * rect.height

                let barRect = CGRect(
                    x: x,
                    y: (rect.height - height) / 2,
                    width: barWidth,
                    height: height
                )

                path.addRoundedRect(
                    in: barRect,
                    cornerSize: CGSize(width: barWidth / 2, height: barWidth / 2)
                )

                x += barWidth + spacing
            }
        }
    }
}
import SwiftUI
import AVFoundation

public struct AudioWave: View {

    let asset: AVURLAsset
    let progress: CGFloat
    let spacing: CGFloat
    let barWidth: CGFloat
    let height: CGFloat

    @State private var samples: [Float] = []
    @State private var audioInfo: AudioInfo?

    public init(
        asset: AVURLAsset,
        progress: CGFloat,
        spacing: CGFloat = 2,
        barWidth: CGFloat = 2,
        height: CGFloat = 40
    ) {
        self.asset = asset
        self.progress = progress
        self.spacing = spacing
        self.barWidth = barWidth
        self.height = height
    }

    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {

                // Background waveform
                AudioWaveShape(
                    samples: samples,
                    spacing: spacing,
                    barWidth: barWidth
                )
                .fill(Color.white.opacity(0.25))

                // Progress waveform
                AudioWaveShape(
                    samples: samples,
                    spacing: spacing,
                    barWidth: barWidth
                )
                .fill(
                    LinearGradient(
                        colors: [.gray, Color.appColor(.white)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .frame(width: geo.size.width * progress)
                .clipped()
            }
            .frame(height: height)
            .task(id: geo.size.width) {
                await loadSamples(width: geo.size.width)
            }
        }
        .frame(height: height)
    }

    private func loadSamples(width: CGFloat) async {
        guard audioInfo == nil else { return }

        do {
            let info = try SignalProcessingHelper.samples(asset)
            audioInfo = info

            let barCount = Int(width / (barWidth + spacing))
            let downsampled = SignalProcessingHelper.downsample(info.samples, count: barCount)

            await MainActor.run {
                self.samples = downsampled
            }
        } catch {
            print("Waveform error:", error)
        }
    }
}
