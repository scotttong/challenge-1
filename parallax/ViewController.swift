//
//  ViewController.swift
//  parallax
//
//  Created by Scott Tong on 11/25/15.
//  Copyright © 2015 Scott Tong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var contentView: UIImageView!
	@IBOutlet weak var photoView: UIImageView!
	@IBOutlet weak var photoContainer: UIView!
	
	var offset: CGFloat!
	var photoHeight: CGFloat!

	
	override func viewDidLoad() {
		
		
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		//size of the frame of the scrollview
		scrollView.frame.size = CGSize(width:view.frame.width, height:view.frame.height)

		//size of the content
		scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.height + photoView.frame.height + 64)
		
		//add scrollView delegate
		scrollView.delegate = self
		
		//original height of the photo
		photoHeight = CGFloat(photoContainer.center.y)
		
		print(photoHeight)

	
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func scrollViewDidScroll(scrollView: UIScrollView) {

//		ORIGINAL VERSION
		
//		let parallax: CGFloat! = 0.25
//
//		//calculate the offset
//		offset = CGFloat(scrollView.contentOffset.y)
//		print("offset: \(scrollView.contentOffset.y)")
//		
//		//move the photo container
//		photoContainer.center.y = CGFloat(photoHeight + (offset * parallax))
//		print("photo: \(photoContainer.center.y)")
		
// NEW VERSION 1

		//calculate the offset
		offset = CGFloat(scrollView.contentOffset.y)
		print("offset: \(scrollView.contentOffset.y)")

		// scroll up - parallax effect
		if offset >= 0 {
			photoContainer.center.y = CGFloat(photoHeight + (offset * 0.25))
		}
		// pull down - lock to top / scale effect
		else {
			photoContainer.center.y = CGFloat (photoHeight + offset)
		}

		
	}
	


}

