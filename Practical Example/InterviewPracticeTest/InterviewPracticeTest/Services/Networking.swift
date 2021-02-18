//
//  Networking.swift
//  InterviewPracticeTest
//
//  Created by Shruti Sharma on 2/17/21.
//

import Foundation

enum NetworkError: Swift.Error, CustomStringConvertible {
  case network
  case parsing
  case unknown
  
  var description: String {
    switch self {
    case .network: return "A network error occured."
    case .parsing: return "Unable to parse server response."
    case .unknown: return "An unkown error occured."
    }
  }
  
  init(_ error: Swift.Error) {
    switch error {
    case is NetworkError: self = .network
    case is DecodingError: self = .parsing
    default: self = .unknown
    }
  }
}

final class Networking {
  
  public func fetchData(from urlString: String) {
//    guard let url = URL(string: urlString) else { }
//    URLSession.shared.dataTaskPublisher(for: url)
//      .tryMap(<#T##transform: ((data: Data, response: URLResponse)) throws -> T##((data: Data, response: URLResponse)) throws -> T#>)
  }
}
