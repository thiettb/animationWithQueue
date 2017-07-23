//
//  AnimationWithQueue.swift
//  DemoAnimation
//
//  Created by ThietTB on 7/23/17.
//  Copyright © 2017 bipbipdinang. All rights reserved.
//

import UIKit

class AnimationWithQueue: UIView {
    //Mark: Property
    var queue = Queue<AnimateItem>()
    
    init(frame: CGRect ,queue: Queue<AnimateItem>) {
        self.queue = queue
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: Function
    func animateQueue(view: UIView){
        if (queue.count > 0){
            let dequeue = self.queue.dequeue()
            let item : AnyObject = dequeue?.item as AnyObject
            let time : CGFloat = (dequeue?.animateTime)! as CGFloat
            UIView.animate(withDuration: TimeInterval(time), animations: {
                if item is CGPoint{
                    view.center = item as! CGPoint
                }
                if item is UIColor{
                    view.backgroundColor = item as? UIColor
                }
                if item is CGAffineTransform{
                    view.transform = item as! CGAffineTransform
                }
            }, completion: { (finished) in
                self.animateQueue(view: view)
            })
            
        
        }
    
    }


    
}
