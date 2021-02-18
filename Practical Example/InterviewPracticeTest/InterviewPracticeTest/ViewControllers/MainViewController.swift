//
//  ViewController.swift
//  InterviewPracticeTest
//
//  Created by Shruti Sharma on 2/17/21.
//

import UIKit

class MainViewController: UIViewController {

  enum Section {
    case main
  }
  
//  private var tutorials = [Tutorial(name: <#T##String#>, artwork: <#T##String#>, description: <#T##String#>, type: <#T##ContentType#>)]
  
  typealias CollectionViewDataSource = UICollectionViewDiffableDataSource<Section, Tutorial>
  var dataSource: CollectionViewDataSource?
  
  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: configureCollectionViewLayout())
    collectionView.backgroundColor = .systemBackground
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    collectionView.register(TutorialCollectionViewCell.self,
                            forCellWithReuseIdentifier: TutorialCollectionViewCell.reuseIdentifier)
    return collectionView
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    configureCollectionViewDataSource()
    reloadData()
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
  }
  
  private func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .estimated(205))
    let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                       subitems: [layoutItem])
    
    let section = NSCollectionLayoutSection(group: layoutGroup)
    return UICollectionViewCompositionalLayout(section: section)
  }

  private func configureCollectionViewDataSource() {
    dataSource = CollectionViewDataSource(collectionView: collectionView) { (collectionView, indexPath, tutorial) -> UICollectionViewCell? in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                            TutorialCollectionViewCell.reuseIdentifier,
                                                          for: indexPath) as? TutorialCollectionViewCell else { fatalError("Unable to dequeu cell")  }
      cell.configure(with: tutorial)
      return cell
    }
  }
  
  private func reloadData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Tutorial>()
    snapshot.appendSections([.main])
    for i in 1...10 {
      let tutorial = Tutorial(name: "\(i): Mac Catalyst with Andy Pereira – Podcast S10 E7",
                             artwork: "", description: "Dru flips the switch on his 50th show with Andy Pereira telling us how easy Catalyst can be. After Dru talks about transitioning from developer to architect.", type: .article)
      snapshot.appendItems([tutorial])
    }
    dataSource?.apply(snapshot)
  }
  
}

