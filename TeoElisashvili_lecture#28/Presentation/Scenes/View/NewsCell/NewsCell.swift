//
//  NewsCell.swift
//  TeoElisashvili_lecture#28
//
//  Created by Teo Elisashvili on 08.06.21.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCell.cornerRadius()
    }

    func configure(with item: NewsViewModel) {
        imageViewCell.kf.setImage(with: item.urlToImage)
        descriptionLbl.text = item.description
        authorLbl.text = item.author
        timeLbl.text = item.publishedAt
    }
}
