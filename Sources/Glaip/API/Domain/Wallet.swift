//
//  Wallet.swift
//  
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import Foundation

public struct Wallet: Equatable {
  public let type: WalletType
  public let address: String
  public let chainId: String
}

