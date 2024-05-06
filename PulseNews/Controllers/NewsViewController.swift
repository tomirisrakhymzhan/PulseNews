//
//  NewsViewController.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 28/04/2024.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 250
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: NewsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  SingletonDataSource.sharedInstance.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath)
        as! NewsTableViewCell
        guard let news = SingletonDataSource.sharedInstance.getElement(at: indexPath.row) else{
            print("news at index \(indexPath.row) does not exist")
            return UITableViewCell()
        }
        cell.setupUI(news: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "ReadNewsViewController") as! ReadNewsViewController
        guard let news = SingletonDataSource.sharedInstance.getElement(at: indexPath.row) else{
            print("news at index \(indexPath.row) does not exist")
            return
        }
        detailVC.newsImageName = news.imageName
        detailVC.newsTitle = news.title
        detailVC.category = news.category
        detailVC.numOfReads = news.numOfReads
        detailVC.postDate = news.postDate!
        detailVC.newsBody = news.newsBody

        navigationController?.pushViewController(detailVC, animated: true)


    }

}
