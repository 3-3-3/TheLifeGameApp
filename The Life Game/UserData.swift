//
//  UserData.swift
//  The Life Game
//
//  Created by Liam Keeley on 7/25/18.
//  Copyright © 2018 Liam Keeley. All rights reserved.
//

import UIKit

public struct UserData {
  public static var goals : [Goal] = [Goal(g: "Finish This App", t: "Finish", p: 100, d: .MIND, l: .YEARLY),
                                      Goal(g: "Say Three Nice Things", t: "Say Nice Things", p: 25, d: .HEART, l: .STATIC),
                                      Goal(g : "Meet someone new", t : "Meet Someone", p : 50, d : .BODY, l : .DAILY),
                                      Goal(g: "Clean Your House", t: "Clean", p: 75, d: .BODY, l: .WEEKLY),
                                      Goal(g: "Go to the gym three times a week", t: "Go To the Gym", p: 75, d: .MIND, l: .WEEKLY),
                                      Goal(g: "Go to a resturant you have never been to", t: "Go Out", p: 50, d: .HEART, l: .DAILY),
                                      Goal(g: "Think of a compliment.  Say it to the next person you see", t: "Compliment", p: 25, d: .HEART, l: .DAILY),
                                      Goal(g: "Do an abbs work out everyday", t: "Abbs workout", p: 50, d: .BODY, l: .STATIC),
                                      Goal(g: "Meditate for 25 minutes", t: "Meditate", p: 25, d: .MIND, l: .DAILY),
                                      Goal(g: "Run a total of 10 miles this week", t: "Run", p: 25, d: .HEART, l: .WEEKLY)
                                      ]
  
  public static var pastTotal : [Day] = [Day(date: Date(), points: 100),
                                    Day(date: Date(timeIntervalSinceNow: -(60*60*24)), points: 75),
                                    Day(date: Date(timeIntervalSinceNow: -2*(60*60*24)), points: 125),
                                    Day(date: Date(timeIntervalSinceNow: -3*(60*60*24)), points: 150),
                                    Day(date: Date(timeIntervalSinceNow: -4*(60*60*24)), points: 50)]
  
  public static var pastMind : [Day] = [Day(date : Date(), points : 100)]
  
  public static var pastBody : [Day] = [Day(date : Date(), points : 125)]
  
  public static var pastHeart : [Day] = [Day(date : Date(), points : 75)]
  
  public static func addGoal(goal : Goal) {
    goals.append(goal)
  }
  
    //helper func to resize image for use in mainInterfaceControllerButton, and elsewhere
  //Taken from StackOverflow : https://stackoverflow.com/questions/31314412/how-to-resize-image-in-swift, user Kirit Modi
  public static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
}
}
