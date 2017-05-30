//
//  AcronymTableViewCell.swift
//  Acronym
//

import UIKit

class AcronymTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var resultLine: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutMargins.left = CGFloat(indentationLevel) * indentationWidth
        self.contentView.layoutIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
