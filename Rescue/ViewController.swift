//
//  ViewController.swift
//  Rescue
//
//  Created by Alex Chen on 2015/1/29.
//  Copyright (c) 2015年 KKAwesome. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var layout : BRASpringyCollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout = BRASpringyCollectionViewFlowLayout()
        layout.largeCellDimension = 132;
        layout.mediumCellDimension = 124;
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 250, height: 250)
        
        collectionView = UICollectionView(frame: CGRectMake(0, -50, self.view.frame.width, self.view.frame.height), collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(collectionView!)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        //  self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        // self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.title = "求救自救平台"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        self.collectionView.reloadData()
        collectionView.alpha = 0
        layout.moveVisibleAttributesOffscreenAndSpringIntoPositionWithExtraDragDistance(400, fromDirection: BRASpringyCollectionViewFlowLayoutDirection.Down, startBlock: nil)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.collectionView.alpha = 1
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as? CollectionViewCell
        
        
        switch indexPath.item{
        case 0:
            cell?.tintColor = UIColor(red: 244/255, green: 0, blue: 9/255, alpha: 1)
            cell?.setTitle("求救")
            cell?.setImage("my-topic")
            break
        case 1:
            cell?.tintColor = UIColor(red: 252/255, green: 143/255, blue: 46/255, alpha: 1)
            cell?.setTitle("尋找訊號")
            cell?.setImage("near-me")
            break
        case 2:
            cell?.tintColor = UIColor(red: 3/255, green: 149/255, blue: 60/255, alpha: 1)
            cell?.setTitle("救難點")
            cell?.setImage("geo-fence")
            break
        case 3:
            cell?.tintColor = UIColor(red: 61/255, green: 148/255, blue: 179/255, alpha: 1)
            cell?.setTitle("設定")
            cell?.setImage("settings")
            break
        default:
            break
        }
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var view : UIViewController?
        
        switch indexPath.item{
        case 0:
            
            view = storyboard.instantiateViewControllerWithIdentifier("SendCardView") as? UIViewController
            view?.modalPresentationStyle=UIModalPresentationStyle.OverFullScreen
            
            
            let popoverPresentationViewController = view?.popoverPresentationController
            popoverPresentationViewController?.permittedArrowDirections = .Any
            popoverPresentationViewController?.delegate = self
            popoverPresentationController?.sourceRect = self.view.frame
            presentViewController(view!, animated: true, completion: nil)
            
            //self.presentViewController(SendCardViewController(), animated: true, completion: nil)
            
            
            // view = storyboard.instantiateViewControllerWithIdentifier("SendCardView") as? UIViewController
            
            //view = storyboard.instantiateViewControllerWithIdentifier("MessageView") as? UIViewController
            break
        case 1:
            
            view = storyboard.instantiateViewControllerWithIdentifier("ReeciveCardView") as? UIViewController
            view?.modalPresentationStyle=UIModalPresentationStyle.OverFullScreen
            
            
            let popoverPresentationViewController = view?.popoverPresentationController
            popoverPresentationViewController?.permittedArrowDirections = .Any
            popoverPresentationViewController?.delegate = self
            popoverPresentationController?.sourceRect = self.view.frame
            presentViewController(view!, animated: true, completion: nil)
            
            
            break
            
        case 2:
            view = storyboard.instantiateViewControllerWithIdentifier("MapView") as? UIViewController
            
            
            if view != nil{
                layout.makeAllCellsFlyOffScreenInDirection(BRASpringyCollectionViewFlowLayoutDirection.Down, completionBlock: {
                    self.navigationController?.pushViewController(view!, animated: true)
                    collectionView.alpha = 0
                })
            }
            
            break
        case 3:
            view = storyboard.instantiateViewControllerWithIdentifier("SettingView") as? UIViewController
            if view != nil{
                layout.makeAllCellsFlyOffScreenInDirection(BRASpringyCollectionViewFlowLayoutDirection.Down, completionBlock: {
                    self.navigationController?.pushViewController(view!, animated: true)
                    collectionView.alpha = 0
                })
            }
            break
            
        default:
            break
        }
        
        /*
        
        if view != nil{
        layout.makeAllCellsFlyOffScreenInDirection(BRASpringyCollectionViewFlowLayoutDirection.Down, completionBlock: {
        //self.navigationController?.presentationController(
        
        self.presentViewController(view!, animated: true, completion: nil)
        //self.navigationController?.pushViewController(view!, animated: true)
        collectionView.alpha = 0
        })
        }
        */
        
    }
}

