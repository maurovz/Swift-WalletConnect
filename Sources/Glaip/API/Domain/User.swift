//
//  User.swift
//  
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import Foundation

public struct User: Equatable {
  public init(wallet: Wallet) {
    self.wallet = wallet
  }

  public let wallet: Wallet
}

