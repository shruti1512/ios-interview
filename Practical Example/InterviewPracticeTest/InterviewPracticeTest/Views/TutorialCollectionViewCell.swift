//
//  TutorialCollectionViewCell.swift
//  InterviewPracticeTest
//
//  Created by Shruti Sharma on 2/17/21.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
  
  
  lazy var nameLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .preferredFont(forTextStyle: .title1)
    label.textColor = .label
    label.numberOfLines = 2
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .preferredFont(forTextStyle: .title1)
    label.textColor = .label
    label.numberOfLines = 2
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var artworkImgView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(systemName: "photo")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    addSubviews([nameLabel, descriptionLabel, artworkImgView])
  }
  
  private func setupLayout() {
  }
  
  // var tutorialTypeName: UILabel!
}
