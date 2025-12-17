//
//  AppState.swift
//  BopSpot
//
//  Created by Anıl Aygün on 10.12.2025.
//

import Foundation
import Observation

@Observable
@MainActor
class AppState{
    
    enum state{
        case splash
        case auth
        case main
    }
    
}
