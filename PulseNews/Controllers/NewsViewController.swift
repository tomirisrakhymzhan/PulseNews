//
//  NewsViewController.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 28/04/2024.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = SingletonDataSource.sharedInstance.getAllNews() {
        didSet {
            tableView.reloadData()
        }
    }
    var timer1 : Timer?
    var timer2 : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 250
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: NewsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        //timer with random interval 0-25 seconds to create a random new news post
        timer1 = Timer.scheduledTimer(withTimeInterval: TimeInterval(Float(Int.random(in: 0...10))), repeats: true) { _ in
            print("Timer fired, new news created")
            SingletonDataSource.sharedInstance.createRandomNews()
            self.dataSource = SingletonDataSource.sharedInstance.getAllNews()
            
        }
        
        //timer with random interval to create a random new news post
        timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            print("Timer fired, number of reads count updated")
            SingletonDataSource.sharedInstance.updateNumberOfReadsCountRandomly()
            self.dataSource = SingletonDataSource.sharedInstance.getAllNews()
            
        }
        
    }
    
    // Invalidate and release the timer when NewsViewController is deallocated
    deinit {
        timer1?.invalidate()
        timer1 = nil
        timer2?.invalidate()
        timer2 = nil
        print("Timers invalidated")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  SingletonDataSource.sharedInstance.getAllNews().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath)
        as! NewsTableViewCell
        let news = dataSource[indexPath.row]
        cell.setupUI(news: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "ReadNewsViewController") as! ReadNewsViewController
        let news = dataSource[indexPath.row]
        detailVC.newsImageName = news.imageName
        detailVC.newsTitle = news.title
        detailVC.category = news.category
        detailVC.numOfReads = news.numOfReads
        detailVC.postDate = news.postDate!
        detailVC.newsBody = news.newsBody

        navigationController?.pushViewController(detailVC, animated: true)


    }

}
