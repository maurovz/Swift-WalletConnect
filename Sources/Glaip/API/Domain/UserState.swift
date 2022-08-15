//
//  UserState.swift
//  
//
//  Created by Mauricio Vazquez on 15/8/22.
//

import Foundation

public enum UserState: Equatable {
  case unregistered
  case loggedIn(User)
  case sessionExpired(User)
}

