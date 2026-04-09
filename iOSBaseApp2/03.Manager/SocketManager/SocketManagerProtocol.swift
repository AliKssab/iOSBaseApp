//
//  SocketManagerProtocol.swift
//  SPEAKER
//
//  Created by Ali Mostafa on 24/02/2026.
//

protocol SocketManagerProtocol {
    func connect()
    func disconnect()
    
    func onConnect(_ completion: @escaping () -> Void)
    
    func join(roomID: Int)
    func leave(roomID: Int)
    
    func send(event: String, data: [String: Any])
    
    func listen(event: String, completion: @escaping ([String: Any]) -> Void)
    
    func removeAllListeners()
}
