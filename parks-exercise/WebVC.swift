//
//  WebVC.swift
//  parks-exercise
//
//  Created by Amadeu Andrade on 19/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    //MARK: - Properties
    
    var webView: WKWebView!
    var url: String!
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var container: UIView!
    
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)
        loadRequest(url)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
    }
    
    
    //MARK: - IBActions
    @IBAction func onBackBtnPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    //MARK: - Load Request
    
    func loadRequest(urlStr: String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }


}
