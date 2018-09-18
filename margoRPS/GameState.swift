//
//  GameState.swift
//  margoRPS
//
//  Created by Margo Freed on 7/9/18.
//  Copyright © 2018 Margo Freed. All rights reserved.
//

import Foundation

enum GameState {
    case lose, win, draw, start
    
    var status: String {
        switch self {
        case .lose:
            return "You Lose!"
        case .win:
            return "You Win!"
        case .draw:
            return "It's a Draw!"
        case .start:
            return "Rock, Paper, Scissors?"
        }
    }
}
