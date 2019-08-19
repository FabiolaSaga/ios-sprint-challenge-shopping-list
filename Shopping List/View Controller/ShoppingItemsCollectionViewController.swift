//
//  ShoppingItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Fabiola S on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewController: UICollectionViewController {
    
    let shoppingItemController = ShoppingItemController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextStepSegue" {
            guard let shoppingItemDetailVC = segue.destination as? ShoppingItemDetailViewController else { return }
            shoppingItemDetailVC.shoppingItemController = shoppingItemController
        }
    }
  
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingItemController.wasAddedToList.count
        } else {
            return shoppingItemController.notAddedToList.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }
    
        cell.item = shoppingListItem(indexPath)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingListItem(indexPath)
        shoppingItemController.addToList(for: item)
        collectionView.reloadData()
    }


    func shoppingListItem(_ indeXPath: IndexPath) -> ShoppingItem {
        if indeXPath.section == 0 {
        return shoppingItemController.wasAddedToList[indeXPath.item]
        } else {
            return shoppingItemController.notAddedToList[indeXPath.item]
        }
    }

}
