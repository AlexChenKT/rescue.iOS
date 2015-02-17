//
//  MessageSendView.swift
//  Rescue
//
//  Created by Alex Chen on 2015/2/16.
//  Copyright (c) 2015年 KKAwesome. All rights reserved.
//


import UIKit

@IBDesignable class MessageSendView: UIView {
    
 
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setup(){
        view = loadViewFromNib()
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView{
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "SendMessageView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        
        return view
    }
    
    
 
}