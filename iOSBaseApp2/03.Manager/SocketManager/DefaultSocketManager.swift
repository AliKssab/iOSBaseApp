//
//  DefaultSocketManager.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 24/02/2026.
//

import SocketIO
import Foundation
import Factory 

final class DefaultSocketManager: SocketManagerProtocol {

    private let socket: SocketIOClient
    private let manager: SocketManager

    init() {
        let url = URL(string: "https://speaker-sa.com:3000")!
        
        manager = SocketManager(socketURL: url, config: [
            .log(true),
            .compress,
            .forceWebsockets(true)
        ])
        
        socket = manager.defaultSocket
        socket.onAny { event in
//            print("🔥 EVENT:", event.event)
//            print("🔥 DATA:", event.items ?? [])
        }
    }

    func connect() {
        socket.connect()
    }

    func disconnect() {
        socket.disconnect()
    }

    func onConnect(_ completion: @escaping () -> Void) {
        socket.on(clientEvent: .connect) { _, _ in
            completion()
        }
    }

    func join(roomID: Int) {
        let room = "private-order.\(roomID)"
        print("Joining room:", room)
        socket.emit("join", room)  // lowercase
    }

    func leave(roomID: Int) {
        socket.emit("join", ["room_id": roomID])
    }

    func send(event: String, data: [String: Any]) {
        socket.emit(event, data)
    }

    func listen(event: String, completion: @escaping ([String: Any]) -> Void) {
        socket.on(event) { response, _ in
            if let dict = response.first as? [String: Any] {
                completion(dict)
            }
        }
    }

    func removeAllListeners() {
        socket.removeAllHandlers()
    }
}
extension Container {
    var socketManager: Factory<SocketManagerProtocol> {
        Factory(self) { DefaultSocketManager() }
            .singleton
    }
}
