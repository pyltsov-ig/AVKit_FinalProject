//
//  CustomCell.swift
//  AVKit_FinalProject
//
//  Created by Igor Pyltsov on 20.07.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var videoImage:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 270, height: 200))
        return imageView
    }()
    
    var videoTitle:UILabel = {
        let title = UILabel(frame: CGRect(x: 50, y: 250, width: 270, height: 60))
        title.numberOfLines = 2
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(videoImage)
        self.addSubview(videoTitle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
