//
//  MusicBankFindViewController.swift
//  MusicBank
//
//  Created by flqy on 2021/3/13.
//  Copyright © 2021 onelact. All rights reserved.
//

import UIKit
import IGListKit



class MusicBankFindViewController: MusicBankViewController {

    @IBOutlet weak var collectionView: ListCollectionView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var microphoneButton: UIButton!
    
    private
    lazy var adapter: ListAdapter = {
         return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: microphoneButton)
        
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: false)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        
    }
    
    
}

// MARK: ListAdapterDataSource
extension MusicBankFindViewController:ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [1,2].map{NSNumber.init(value: $0)}
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        guard let data = object as? Int else {
            fatalError()
        }
        if data == 1 {
            return ToolSectionController()
        }
        return ToolItemSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
