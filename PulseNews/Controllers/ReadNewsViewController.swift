//
//  ReadNewsViewController.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 29/04/2024.
//

import UIKit

class ReadNewsViewController: UIViewController {
    
    let dateFormatter = DateFormatter()

    @IBOutlet weak var newsImageView: UIImageView!
    var newsImageName = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    var newsTitle = ""
    
    @IBOutlet weak var categoryLabel: UILabel!
    var category = ""
    
    @IBOutlet weak var numOfReadsLabel: UILabel!
    var numOfReads = 0
    
    @IBOutlet weak var postDateLabel: UILabel!
    var postDate : Date = Date()
    
    @IBOutlet weak var newsBodyTextView: UITextView!
    var newsBody = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("view didload readnewsvc")
        print("newsTitle: \(String(describing: newsTitle))")
        print("category: \(String(describing: category))")
        print("numOfReads: \(numOfReads)")
        print("postDate: \(postDate)")
        print("newsImageName: \(String(describing: newsImageName))")
        print("newsBody: \(String(describing: newsBody))")

        // Do any additional setup after loading the view.
        dateFormatter.dateStyle = .medium
        titleLabel.text = newsTitle
        categoryLabel.text = category
        numOfReadsLabel.text = String(numOfReads)
        postDateLabel.text = dateFormatter.string(from: postDate)
        newsImageView.image =  UIImage(named: newsImageName)
        newsBodyTextView.text = newsBody
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
