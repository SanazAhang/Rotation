//
//  Badge.swift
//  location
//
//  Created by SanazAhang on 10/6/22.
//

import UIKit

protocol CheckActionDeligate {
    
   func CheckButton(_ sender:UIButton)
    
    
}

class BadgeButton:UIView  {
    
    var delegate : CheckActionDeligate?

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet var contentView: UIView!
    //  init used if the view is created programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }

    //  init used if the view is created through IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }

    //  Do custom initialization here
    private func customInit()
    {

        Bundle.main.loadNibNamed("BadgeButton", owner: self, options: nil)
        badgeLabel.layer.masksToBounds = true
        badgeLabel.layer.cornerRadius = badgeLabel.frame.height/2
        
        checkButton.layer.masksToBounds = true
        checkButton.layer.cornerRadius = 10
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    @IBAction func CheckButtonAction(_ sender: UIButton)
    {
        
        delegate?.CheckButton(sender)
    }
}
