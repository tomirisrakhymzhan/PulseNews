//
//  News.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 28/04/2024.
//

import Foundation
struct News {
    var title: String
    var category: String
    var numOfReads: Int
    var postDate: Date?
    var imageName: String
    var isSaved: Bool
    
    static func createNewsList(numOfNews: Int) -> [News] {
        var newsList : [News] = []
        for i in 0..<numOfNews {
            let postDate = Date(timeIntervalSinceNow: TimeInterval.random(in: -604800...0)) // Random date within the last week
            let news = News(title: "News Title \(i)", category: "Category", numOfReads: 23, postDate: postDate, imageName: "random", isSaved: false)
            newsList.append(news)
        }
        print(newsList)
        return newsList
    }
}

