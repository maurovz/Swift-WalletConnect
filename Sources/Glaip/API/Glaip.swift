//
//  WristBandAPI.swift
//  
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import SwiftUI
import Combine

public final class Glaip: ObservableObject {
  private let walletConnect: WalletLinkService

  let title: String
  let description: String

  public let supportedWallets: [WalletType]

  var currentWallet: WalletType?

  @Published public var userState: UserState = .unregistered

  public init(title: String, description: String, supportedWallets: [WalletType]) {
    self.title = title
    self.description = description
    self.supportedWallets = supportedWallets
    self.walletConnect = WalletLinkService(title: title, description: description)
  }

  public func loginUser(type: WalletType, completion: @escaping (Result<String, Error>) -> Void) {
    switch type {
    case .WalletConnect:
      metaMaskLogin(completion: { [weak self] result in
        guard let self = self else { return }

        DispatchQueue.main.async {
          switch result {
          case let .success(user):
            self.userState = .loggedIn(user)
            self.currentWallet = .WalletConnect
          case let .failure(error):
            completion(.failure(error))
          }
        }
      })
    case .Rainbow:
      rainbowLogin(completion: { [weak self] result in
        guard let self = self else { return }

        DispatchQueue.main.async {
          switch result {
          case let .success(user):
            self.userState = .loggedIn(user)
            self.currentWallet = .Rainbow
          case let .failure(error):
            completion(.failure(error))
          }
        }
      })
    }
  }

  public func logout() {
    walletConnect.disconnect()
  }
}

// MARK: - MetaMask
extension Glaip {
  private func metaMaskLogin(completion: @escaping (Result<User, Error>) -> Void) {
    let service = WalletLinkService(title: title, description: description)
    service.connect(wallet: .MetaMask, completion: { result in

      switch result {
      case let .success(walletDetails):
        completion(.success(
          User(
            wallet: Wallet(
              type: .WalletConnect,
              address: walletDetails.address,
              chainId: String(walletDetails.chainId))
          ))
        )
      case let .failure(error):
        completion(.failure(error))
      }
    })
  }
}

// MARK: - Rainbow Wallet
extension Glaip {
  private func rainbowLogin(completion: @escaping (Result<User, Error>) -> Void) {
    let service = WalletLinkService(title: title, description: description)
    service.connect(wallet: .Rainbow, completion: { result in

      switch result {
      case let .success(walletDetails):
        completion(.success(
          User(
            wallet: Wallet(
              type: .WalletConnect,
              address: walletDetails.address,
              chainId: String(walletDetails.chainId))
          ))
        )
      case let .failure(error):
        completion(.failure(error))
      }
    })
  }
}
