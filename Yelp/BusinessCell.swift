//
//  BusinessCell.swift
//  Yelp
//
//  Created by Sumaiya Mansur on 3/10/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dollarsLabel: UILabel!
    
    var business: Business! {
        didSet {
            
            nameLabel.text = business.name
            thumbImageView.setImageWithURL(business.imageURL!)
            reviewsLabel.text = "\(business.reviewCount!) Reveiws"
            distanceLabel.text = business.distance
            categoriesLabel.text = business.categories
           addressLabel.text = business.address
           ratingImageView.setImageWithURL(business.ratingImageURL!)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
       thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true

        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    }

