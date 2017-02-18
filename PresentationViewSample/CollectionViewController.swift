//
//  CollectionViewController.swift
//  PresentationViewSample
//
//  Created by hirauchi.shinichi on 2017/02/18.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    // 画像の種類　000.png 〜 024.png
    let image_max = 35
    let orgTrasition = OrgTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image_max
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        // ImageViewにTag=1がセットされています
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: IndexPathToImageName(indexPath: indexPath))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dist = segue.destination as? PresentationViewController, let indexPath = sender as? IndexPath {
            dist.imageName = IndexPathToImageName(indexPath: indexPath)

            dist.modalPresentationStyle = .overCurrentContext
            dist.transitioningDelegate = orgTrasition
        }
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoPresentaionView", sender: indexPath)
    }
    
    // MARK: private
    func IndexPathToImageName(indexPath: IndexPath) -> String {
        return String(format: "%03d.png", indexPath.row)
    }
    
}
