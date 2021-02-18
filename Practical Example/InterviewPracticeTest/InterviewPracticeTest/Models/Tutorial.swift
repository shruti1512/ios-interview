//
//  Tutorial.swift
//  InterviewPracticeTest
//
//  Created by Shruti Sharma on 2/17/21.
//

import Foundation

enum ContentType: String {
  case article = "Article"
  case video = "Video"
}

struct Tutorial: Hashable {
  let name: String
  let artwork: String
  let description: String
  let type: ContentType
}
