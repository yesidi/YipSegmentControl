//
//  YipSegmentControl.swift
//  stqingmang
//
//  Created by iOSDev on 2017/5/3.
//  Copyright © 2017年 eddie. All rights reserved.
//

import UIKit

private let reuseIdentifier = "YipSementItem"

class YipSegmentControl: UICollectionViewController {
    static var sectionInsetLeft:CGFloat = 0
    static var sectionInsetRight:CGFloat = 0

    var segWidthFirst:CGFloat = 0 {
        didSet{
            guard let c = self.collectionView else { return }
            (c.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset.left = (c.bounds.width/2) - (segWidthFirst/2)
        }
    }
    
    var segWidthLast:CGFloat = 0 {
        didSet{
            guard let c = self.collectionView else { return }
            (c.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset.right = (c.bounds.width/2) - (segWidthLast/2)
        }
    }
    
    var titles = ["轻芒", "家居", "科技美学", "美妆", "健身", "科技美学科技美学", "家居", "科技美学", "美妆", "健身"]
    var selectedIndex:Int = 0 {
        willSet{
            let item = self.collectionView?.cellForItem(at: IndexPath.init(row: selectedIndex, section: 0)) as? YipSegmentItem
            item?.name.textColor = UIColor.lightGray
        }
        
        didSet {
            let item = self.collectionView?.cellForItem(at: IndexPath.init(row: selectedIndex, section: 0)) as? YipSegmentItem
            item?.name.textColor = UIColor.black
        }
    }
    
    var selectedBlock:(()->Void)?
    var unselectedBlock:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        (self.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        (self.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = CGSize(width: 100, height: 70)
        (self.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing = 0
        (self.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing = 0
        self.collectionView?.showsHorizontalScrollIndicator = false

        // Register cell classes
        self.collectionView!.register(UINib.init(nibName: "YipSegmentItem", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configSelectedStyle(_ block:(()->Void)?) {
        self.selectedBlock = block
    }

    func configUnselectedStyle(_ block:(()->Void)?) {
        self.unselectedBlock = block
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return titles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! YipSegmentItem
    
        // Configure the cell
        cell.name.text = titles[indexPath.row]
        
        if selectedIndex == indexPath.row {
            cell.name.textColor = UIColor.black
        }else {
            cell.name.textColor = UIColor.lightGray
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        self.selectedIndex = indexPath.row
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
