//import AVFoundation
//import UIKit
//
//final class VoiceRecorderManager: NSObject, ObservableObject {
//    
//    static let shared = VoiceRecorderManager()
//    
//    @Published var isRecording = false
//    @Published var showPermissionAlert = false
//    
//    var recordedURL: URL?
//    
//    private var audioRecorder: AVAudioRecorder?
//    
//    // MARK: - Start Recording
//    func startRecording() {
//        
//        let session = AVAudioSession.sharedInstance()
//        
//        switch session.recordPermission {
//            
//        case .granted:
//            beginRecording()
//            
//        case .denied:
//            showPermissionAlert = true
//            return
//            
//        case .undetermined:
//            session.requestRecordPermission { [weak self] allowed in
//                DispatchQueue.main.async {
//                    if allowed {
//                        self?.beginRecording()
//                    } else {
//                        self?.showPermissionAlert = true
//                    }
//                }
//            }
//            
//        @unknown default:
//            return
//        }
//    }
//    
//    // MARK: - Stop Recording
//    func stopRecording() {
//        audioRecorder?.stop()
//        isRecording = false
//    }
//}
//
//private extension VoiceRecorderManager {
//    
//    func beginRecording() {
//        do {
//            let session = AVAudioSession.sharedInstance()
//            
//            try session.setCategory(.playAndRecord, mode: .default)
//            try session.setActive(true)
//            
//            let url = FileManager.default.temporaryDirectory
//                .appendingPathComponent("\(UUID().uuidString).m4a")
//            
//            let settings: [String: Any] = [
//                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//                AVSampleRateKey: 12000,
//                AVNumberOfChannelsKey: 1,
//                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
//            ]
//            
//            audioRecorder = try AVAudioRecorder(url: url, settings: settings)
//            audioRecorder?.record()
//            
//            recordedURL = url
//            isRecording = true
//            
//        } catch {
//            print("Recording failed:", error)
//        }
//    }
//}
