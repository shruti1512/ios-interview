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
    // Do any additional setup after loading the view.
  }


}

