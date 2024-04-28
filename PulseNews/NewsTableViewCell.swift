//
//  NewsTableViewCell.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 28/04/2024.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "news-cell"
    static let nibName = "NewsTableViewCell"
    var news : News? = nil
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var numOfReadsLabel: UILabel!
    

    @IBOutlet weak var postDateLabel: UILabel!
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        news?.isSaved.toggle()
        checkSaveBtn()
    }
    
    func checkSaveBtn(){
        let starImg = UIImage(systemName: "star")!
        let filledStarImg = UIImage(systemName: "star.fill")!//
        if self.news?.isSaved == true {
            saveBtn.setImage(filledStarImg, for: .normal)
        }else if self.news?.isSaved == false {
            saveBtn.setImage(starImg, for: .normal)
        }
    }
    func setupUI(news: News) {
        self.news = news
        titleLabel.text = news.title
        categoryLabel.text = news.category
        numOfReadsLabel.text = String(news.numOfReads)
        postDateLabel.text = news.postDate?.description
        newsImageView.image =  UIImage(named: news.imageName)
        checkSaveBtn()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
        newsImageView.layer.cornerRadius = 10.0
        newsImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
