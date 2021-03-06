//
//  ViewController.swift
//  Hokusai
//
//  Created by ytakzk on 07/12/2015.
//  Copyright (c) 2015 ytakzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [HOKColorScheme.Hokusai, HOKColorScheme.Asagi, HOKColorScheme.Matcha, HOKColorScheme.Tsubaki,
    HOKColorScheme.Inari, HOKColorScheme.Karasu, HOKColorScheme.Enshu]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDelegate Protocol
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:ThumbnailCell = collectionView.dequeueReusableCellWithReuseIdentifier("ThumbnailCell", forIndexPath: indexPath) as! ThumbnailCell
        
        var name = "Custom"
        if indexPath.row < items.count {
            name = getName(items[indexPath.row])
        }
        
        cell.photoImageView.image = UIImage(named: name)
        cell.nameLabel.text       = name
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width  = self.view.frame.width
        let height = self.view.frame.height
        let length = (width < height) ? width*0.5 : width/3
        
        return CGSize(width: length, height: length)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        /////////////////////////////////////////////
        // Here is the implementation for Hokusai. //
        /////////////////////////////////////////////
        
        let hokusai = Hokusai()
        if indexPath.row % 2 == 0 {
            
            // Add a title
            hokusai.headline = "Information"
            
            // Add a message
            hokusai.message  = "Katsushika Hokusai (葛飾 北斎) was a Japanese artist, ukiyo-e painter and printmaker of the Edo period."
        }
        
        // Add a button with a closure
        hokusai.addButton("Button 1") {
            print("Rikyu")
        }
        
        // Add a button with a selector
        hokusai.addButton("Button 2", target: self, selector: #selector(ViewController.button2Pressed))
        
        // Set a font name. Default is AvenirNext-DemiBold.
        hokusai.fontName      = "Verdana-Bold"
        
        // Set a light font name used for the message. Default is AvenirNext-Light
        hokusai.lightFontName = "Verdana"

        // Change a title for cancel button (Default is Cancel)
        hokusai.cancelButtonTitle = "Done"

        if indexPath.row == 0 {
            // Add a callback for cancel button
            hokusai.cancelButtonAction = {
                print("canceled")
            }
        }
        
        // Select a color scheme
        if indexPath.row < items.count {
            hokusai.colorScheme = items[indexPath.row]
        } else {
            hokusai.colors = HOKColors(
                backGroundColor: UIColor.blackColor(),
                buttonColor: UIColor.purpleColor(),
                cancelButtonColor: UIColor.grayColor(),
                fontColor: UIColor.whiteColor()
            )
        }
        
        // Show Hokusai
        hokusai.show()
    }
    
    func button2Pressed() {
        print("Oribe")
    }
    
    func getName(scheme: HOKColorScheme) -> String {
        if scheme == HOKColorScheme.Hokusai {
            return "Hokusai"
        } else if scheme == HOKColorScheme.Asagi {
            return "Asagi"
        } else if scheme == HOKColorScheme.Matcha {
            return "Matcha"
        } else if scheme == HOKColorScheme.Tsubaki {
            return "Tsubaki"
        } else if scheme == HOKColorScheme.Inari {
            return "Inari"
        } else if scheme == HOKColorScheme.Karasu {
            return "Karasu"
        } else if scheme == HOKColorScheme.Enshu {
            return "Enshu"
        }
        
        return ""
    }

}

