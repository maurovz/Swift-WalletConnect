//
//  Wallet.swift
//  
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import Foundation

public struct Wallet: Equatable {
  let type: WalletType
  let address: String
  let chainId: String
}

