//
//  AudioPlayerManager.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 27/02/2026.
//


import SwiftUI
import AVFoundation
import Combine

final class AudioPlayerManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isPlaying: Bool = false
    @Published var progress: CGFloat = 0.0
    @Published var currentTimeText: String = "0:00"
    @Published var remainingTimeText: String = "0:00"
    
    private var player: AVAudioPlayer?
    private var timer: Timer?
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(stopFromNotification),
            name: .stopAllAudio,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        timer?.invalidate()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async {
            self.isPlaying = false
            self.progress = 0
            self.currentTimeText = "0:00"
            
            let duration = Int(player.duration)
            self.remainingTimeText = String(format: "-%d:%02d", duration / 60, duration % 60)
            
            player.currentTime = 0
         }
    }
    
    // MARK: - Load local audio
    func loadAudiobook(fromLocalURL url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self   // 👈 مهم جداً
            player?.enableRate = true
            player?.isMeteringEnabled = true
            player?.prepareToPlay()
            startTimer()
        } catch {
            print("Failed to load audio: \(error)")
        }
    }
    
    // MARK: - Play / Pause
    func play() {
        NotificationCenter.default.post(name: .stopAllAudio, object: nil) // stop all before play
        player?.play()
        isPlaying = true
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    @objc private func stopFromNotification() {
        if isPlaying {
            pause()
        }
    }
    
    // MARK: - Timer
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.player else { return }
            self.progress = CGFloat(player.currentTime / player.duration)
            self.updateTimeTexts()
        }
    }
    
    private func updateTimeTexts() {
        guard let player = player else { return }
        let current = Int(player.currentTime)
        let remaining = Int(player.duration - player.currentTime)
        currentTimeText = String(format: "%d:%02d", current / 60, current % 60)
        remainingTimeText = String(format: "-%d:%02d", remaining / 60, remaining % 60)
    }
    
    // MARK: - Seek
    func seek(to progress: CGFloat) {
        guard let player = player else { return }
        player.currentTime = Double(progress) * player.duration
        updateTimeTexts()
    }
}
    
import Foundation

extension Notification.Name {
    static let stopAllAudio = Notification.Name("stopAllAudio")
}
