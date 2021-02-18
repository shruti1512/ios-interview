//
//  TutorialCollectionViewCell.swift
//  InterviewPracticeTest
//
//  Created by Shruti Sharma on 2/17/21.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    
  private lazy var nameLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .preferredFont(forTextStyle: .headline)
    label.textColor = .label
    label.numberOfLines = 2
//    label.backgroundColor = .systemGreen
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var techLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .preferredFont(forTextStyle: .body)
    label.textColor = .secondaryLabel
    label.numberOfLines = 1
//    label.backgroundColor = .systemYellow
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var contentTypeLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .preferredFont(forTextStyle: .body)
    label.textColor = .secondaryLabel
    label.numberOfLines = 1
    label.translatesAutoresizingMaskIntoConstraints = false
//    label.backgroundColor = .systemTeal
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = .preferredFont(forTextStyle: .body)
    label.textColor = .secondaryLabel
    label.numberOfLines = 2
    label.translatesAutoresizingMaskIntoConstraints = false
//    label.backgroundColor = .systemGray
    return label
  }()
  
  private lazy var artworkImgView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(systemName: "photo")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private lazy var titleStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, techLabel])
    stackView.axis = .vertical
    return stackView
  }()
  
  private lazy var topStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [titleStackView, artworkImgView])
    stackView.axis = .horizontal
    return stackView
  }()

  private lazy var bottomStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [descriptionLabel, contentTypeLabel])
    stackView.axis = .vertical
    return stackView
  }()

  private lazy var parentStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [topStackView, descriptionLabel, contentTypeLabel])
    stackView.setCustomSpacing(10, after: techLabel)
    stackView.setCustomSpacing(10, after: descriptionLabel)
    stackView.axis = .vertical
    return stackView
  }()

  private lazy var cardView: CardView = {
    let card = CardView(frame: .zero)
    return card
  }()
  
//  private lazy var testView: UIView = {
//    let view = UIView(frame: .zero)
//    view.backgroundColor = .systemBlue
//    return view
//  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    addSubview(cardView)
    cardView.addSubview(parentStackView)
//    cardView.addSubview(testView)
  }
  
  private func setupLayout() {
    cardView.anchor(top: layoutMarginsGuide.topAnchor,
                    leading: layoutMarginsGuide.leadingAnchor,
                    bottom: layoutMarginsGuide.bottomAnchor,
                    trailing: layoutMarginsGuide.trailingAnchor)
    
    parentStackView.anchor(top: cardView.topAnchor,
                           leading: cardView.leadingAnchor,
                           bottom: cardView.bottomAnchor,
                           trailing: cardView.trailingAnchor,
                           padding: UIEdgeInsets(top: cardView.layoutMargins.top,
                                                 left: cardView.layoutMargins.bottom,
                                                 bottom: -cardView.layoutMargins.top,
                                                 right: -cardView.layoutMargins.top))
  }
}

extension TutorialCollectionViewCell: SelfConfigurable {
  
  typealias T = Tutorial
  static let reuseIdentifier = String(describing: TutorialCollectionViewCell.self)

  public func configure(with data: Tutorial) {
    nameLabel.text = data.name
    descriptionLabel.text = data.description
    techLabel.text = "iOS 13, Swift 5"
    contentTypeLabel.text = ContentType.article.rawValue
  }

}
