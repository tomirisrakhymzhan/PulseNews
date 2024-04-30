//
//  News.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 28/04/2024.
//

import Foundation
enum NewsCategory: String, CaseIterable{
    case breaking = "Breaking or Live news"
    case politics = "Politics"
    case lifestyle = "Lifestyle"
    case business = "Business"
    case sport = "Sport"
    case science = "Science"
    case entertainment = "Entertainment"
    
    static func getRandomNewsCategory() -> NewsCategory {
      // Use allCases to get an array of all enum cases
      let allCases = NewsCategory.allCases

      // Use randomElement() to get a random element from the array (force unwrapping needed because the array shouldn't be empty)
        return allCases.randomElement()!
    }
}

struct News {
    var title: String
    var category: String
    var numOfReads: Int
    var postDate: Date?
    var imageName: String
    var isSaved: Bool
    var newsBody: String
    
    static func createNewsList(numOfNews: Int) -> [News] {
        var newsList : [News] = []
        for i in 0..<numOfNews {
            let postDate = Date(timeIntervalSinceNow: TimeInterval.random(in: -604800...0)) // Random date within the last week
            let news = News(title: "News Title \(i)", category: NewsCategory.getRandomNewsCategory().rawValue, numOfReads: Int.random(in: 0...9999), postDate: postDate, imageName: "random \(Int.random(in: 1...7))", isSaved: false, newsBody: News.generateDummNewsBodyText())
            newsList.append(news)
        }
        return newsList
    }
    
    static func generateDummNewsBodyText() -> String {
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque, sem non fringilla porta, nisl augue ullamcorper purus, et rhoncus erat ipsum a dui. Nulla facilisi. Ut semper iaculis risus et volutpat. Curabitur pretium condimentum gravida. Cras eget purus sem. Maecenas varius, lacus sed rhoncus volutpat, augue lacus finibus augue, bibendum finibus turpis est et purus. Pellentesque commodo lectus sed elit gravida, eu placerat elit interdum. Donec bibendum bibendum augue, ac dapibus ante venenatis sed. \n \n Mauris diam velit, dapibus in aliquam eget, iaculis ut est. Sed rutrum finibus sapien, consectetur lacinia mi fermentum ut. Duis felis tortor, iaculis ut metus eget, dapibus fermentum lorem. Vestibulum vel feugiat arcu, in accumsan velit. Aliquam et risus est. Quisque maximus gravida nulla nec tincidunt. Mauris facilisis lacinia consequat. Maecenas convallis imperdiet arcu, in pharetra erat gravida id. Morbi cursus id libero sodales fermentum. Donec lobortis pellentesque mi at aliquam. Suspendisse blandit tempor purus, vel mattis odio accumsan nec. Morbi bibendum mi pretium, interdum arcu commodo, bibendum turpis. Aenean ut laoreet purus. Pellentesque ornare et enim et semper. \n \n Ut in vehicula nisi. Praesent tincidunt feugiat sapien in mollis. Nam eget ligula ac libero congue pharetra ac in neque. Phasellus a mi ut arcu vehicula fermentum. Donec pharetra augue metus, at finibus velit consectetur ac. Vivamus nec nulla nec purus tempus feugiat. Phasellus et tempor nulla, vel egestas lorem. Praesent mattis nisl vitae metus porttitor placerat. Cras mattis orci eu lobortis vehicula. Morbi at dolor mi. Ut tincidunt risus a mi finibus, vitae vestibulum massa dictum. In placerat nisi maximus magna varius vulputate a eleifend ante. Nulla dignissim sem eu nunc pulvinar, quis hendrerit ipsum efficitur. Donec auctor ex in ligula posuere imperdiet. \n \n Duis varius, sem eget pulvinar scelerisque, felis magna ornare leo, in vulputate nisi ipsum eget massa. Duis aliquet sem at dui maximus porttitor. Sed orci mi, porta id ante nec, posuere sollicitudin eros. Duis blandit luctus nunc, sed varius orci consequat vel. Suspendisse scelerisque rutrum massa, eu lobortis nulla ornare ac. Vestibulum ac lorem id odio commodo venenatis. Sed orci mi, luctus placerat eros sit amet, gravida ornare neque. Nulla lacinia turpis eget leo facilisis, quis auctor ligula commodo. Donec aliquet, lorem vel elementum euismod, nisl nibh iaculis mi, eget feugiat dui tortor vitae urna. Morbi vel ornare ligula. In sit amet gravida ligula. Vivamus sollicitudin volutpat sapien, vitae bibendum enim viverra at."
    }
}

