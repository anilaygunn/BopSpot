//
//  KeychainService.swift
//  BopSpot
//
//  Created by Anıl Aygün on 17.12.2025.
//

import Foundation
import Security
import LocalAuthentication


protocol KeychainServiceProtocol {
    func save(data: Data, service: String, account: String)
    func read(service:String, account:String) -> Data?
    func delete(service:String, account:String)
}


final class KeychainService: KeychainServiceProtocol {
    static let shared = KeychainService()
    
    private init(){}
    
    func save(data: Data,service: String,account: String){
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: service
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status == errSecDuplicateItem {
            
            let query = [
                kSecAttrService: service,
                kSecAttrAccount: account,
                kSecClass: kSecClassGenericPassword,
            ] as CFDictionary

            let attributesToUpdate = [kSecValueData: data] as CFDictionary

            SecItemUpdate(query, attributesToUpdate)
        }
    }
    
    func read(service: String, account: String) -> Data? {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
            
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
            
        return (result as? Data)
    }
    
    
        
    func delete(service: String, account: String) {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
        ] as CFDictionary
                
            
        SecItemDelete(query)
    }
    
}
extension KeychainService{
    
    func saveString(_ value : String, service: String, account:String){
        if let data = value.data(using: .utf8) {
            save(data: data, service: service, account: account)
        }
    }
    func readString(service:String ,account: String) -> String? {
        if let data = read(service: service, account: account) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
