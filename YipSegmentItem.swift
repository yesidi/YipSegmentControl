//
//  YipSegmentItem.swift
//  stqingmang
//
//  Created by iOSDev on 2017/5/3.
//  Copyright © 2017年 eddie. All rights reserved.
//

import UIKit

class YipSegmentItem: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let p = super.preferredLayoutAttributesFitting(layoutAttributes)

        if YipSegmentControl.sectionInsetLeft == 0 && p.indexPath.row == 0 {
            YipSegmentControl.sectionInsetLeft = p.frame.width
            self.perform(#selector(refreshLeft), with: nil, afterDelay: 0)
        }
        
        if YipSegmentControl.sectionInsetRight == 0 && p.indexPath.row == 0 {
            YipSegmentControl.sectionInsetRight = p.frame.width
            self.perform(#selector(refreshRight), with: nil, afterDelay: 0)
        }
        
        return p
    }
    
    func refreshLeft() {
        let segControl = self.findNextResponder(self, targerClass: YipSegmentControl.self)
        segControl?.segWidthFirst = YipSegmentControl.sectionInsetLeft
    }
    
    func refreshRight() {
        let segControl = self.findNextResponder(self, targerClass: YipSegmentControl.self)
        segControl?.segWidthLast = YipSegmentControl.sectionInsetRight
    }
    
    //寻找nextResponder
    func findNextResponder<T:AnyObject>(_ responder:AnyObject?, targerClass:T.Type) -> T? {
        guard let aResponder = responder else { return nil }
        if aResponder.self is T {
            return aResponder as? T
        }else{
            return self.findNextResponder(aResponder.next, targerClass: targerClass)
        }
    }
}
