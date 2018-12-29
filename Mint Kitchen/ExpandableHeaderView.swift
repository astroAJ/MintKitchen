//
//  ExpandableHeaderView.swift
//  Mint Kitchen
//
//  Created by Macbook on 22/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate
{
    func toggleSection(header : ExpandableHeaderView, section : Int)

}

class ExpandableHeaderView: UITableViewHeaderFooterView
{
    
    var delelgate : ExpandableHeaderViewDelegate?
    var section : Int!
    
    
    override init(reuseIdentifier: String?)
        {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    @objc func selectHeaderAction(gestureRecognizer : UITapGestureRecognizer)
    {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delelgate?.toggleSection(header: self, section: cell.section)
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customInit(title : String, section : Int, delegate : ExpandableHeaderViewDelegate)
    {
        self.section = section
        self.delelgate = delegate
        self.textLabel?.text = title
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
    override func awakeFromNib() {
    
    
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
