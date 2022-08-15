//
//  WalletConnect.swift
//  
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import Foundation
import WalletConnectSwift

protocol WalletConnectDelegate: AnyObject {
  func failedToConnect()
  func didConnect()
  func didDisconnect()
  func didUpdate()
}

final class WalletConnect {
  var session: Session!
  var client: Client!
  var wurl: WCURL!

  private let sessionKey = "sessionKey"
  private var delegate: WalletConnectDelegate

  init(delegate: WalletConnectDelegate) {
    self.delegate = delegate
  }

  func connect(title: String, description: String, icons: [URL] = []) -> String {
    // gnosis wc bridge: https://safe-walletconnect.gnosis.io/
    // test bridge with latest protocol version: https://bridge.walletconnect.org
    let bridgeURL = URL(string: "https://safe-walletconnect.gnosis.io/")!
    let clientURL = URL(string: "https://safe.gnosis.io")!

    let wcUrl =  WCURL(topic: UUID().uuidString,
                       bridgeURL: bridgeURL,
                       key: try! randomKey())
    let clientMeta = Session.ClientMeta(name: title,
                                        description: description,
                                        icons: icons,
                                        url: clientURL)
    let dAppInfo = Session.DAppInfo(peerId: UUID().uuidString, peerMeta: clientMeta)
    client = Client(delegate: self, dAppInfo: dAppInfo)

    try! client.connect(to: wcUrl)
    return wcUrl.absoluteString
  }

  func reconnectIfNeeded() {
    if let oldSessionObject = UserDefaults.standard.object(forKey: sessionKey) as? Data,
       let session = try? JSONDecoder().decode(Session.self, from: oldSessionObject) {
      client = Client(delegate: self, dAppInfo: session.dAppInfo)
      try? client.reconnect(to: session)
    }
  }

  func sign(message: String, completion: @escaping (Result<String, Error>) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      guard let accounts = self.session?.walletInfo?.accounts, let wallet = accounts.first else { return }

      do {
        try self.client.personal_sign(
          url: self.session.url,
          message: message,
          account: wallet
        ) { response in
          guard let responseHash = try? response.result(as: String.self) else { return }
          completion(.success(responseHash))
        }
      } catch {
        completion(.failure(error))
      }
    }
  }

  // https://developer.apple.com/documentation/security/1399291-secrandomcopybytes
  private func randomKey() throws -> String {
    var bytes = [Int8](repeating: 0, count: 32)
    let status = SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes)
    if status == errSecSuccess {
      return Data(bytes: bytes, count: 32).toHexString()
    } else {
      enum TestError: Error {
        case unknown
      }
      throw TestError.unknown
    }
  }
}

extension WalletConnect: ClientDelegate {
  func client(_ client: Client, didFailToConnect url: WCURL) {
    delegate.failedToConnect()
  }

  func client(_ client: Client, didConnect url: WCURL) {
    self.wurl = url
    delegate.didConnect()
  }

  func client(_ client: Client, didConnect session: Session) {
    self.session = session
    delegate.didConnect()
  }

  func client(_ client: Client, didDisconnect session: Session) {
    UserDefaults.standard.removeObject(forKey: sessionKey)
    delegate.didDisconnect()
  }

  func client(_ client: Client, didUpdate session: Session) {
    delegate.didUpdate()
  }
}
