//
//  MultaTableTableViewCell.swift
//  MultasRD
//
//  Created by Luis Tejada on 14/1/18.
//  Copyright © 2018 Luis Tejada. All rights reserved.
//

import UIKit

class MultaTableTableViewCell: UITableViewCell {

    var cellContainer : UIView!
    var cellImage : UIImageView!
    var titleMulta : UILabel!
    var precio : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellContainer = UIView(frame: CGRect.zero)
        cellContainer.backgroundColor = UIColor.white
        contentView.addSubview(cellContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Hola!")
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        cellContainer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 3)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
