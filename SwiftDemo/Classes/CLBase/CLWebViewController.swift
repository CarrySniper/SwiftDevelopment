//
//  CLWebViewController.swift
//  SwiftDemo
//
//  Created by CL on 2019/4/15.
//  Copyright © 2019 cl. All rights reserved.
//

import UIKit
import WebKit

class CLWebViewController: CLBaseViewController, WKNavigationDelegate {
	var request: URLRequest!
	
	lazy var progressView: UIProgressView = {
		let view = UIProgressView.init()
		view.tintColor = CLColor.textSelected
		view.backgroundColor = CLColor.textNormal
		return view
	}()

	lazy var webView: WKWebView = {
		let view = WKWebView.init()
		view.backgroundColor = CLColor.viewColor
		view.scrollView.bounces = false
		view.isOpaque = false
		view.navigationDelegate = self
		return view
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.view.addSubview(webView)
		webView.snp.makeConstraints { (make) in
			make.edges.equalTo(self.view)
		}
		
		self.view.addSubview(progressView)
		progressView.snp.makeConstraints { (make) in
			make.top.left.right.equalTo(self.view)
		}
	
		if request != nil {
			webView.load(request)
		}
		
		webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
		webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
    
	deinit {
		webView.removeObserver(self, forKeyPath: "estimatedProgress")
		webView.removeObserver(self, forKeyPath: "title")
	}
	
	override func customBack() {
		if webView.canGoBack {
			webView.goBack()
		} else {
			super.customBack()
		}
	}
	
	func loadUrlString(_ urlString: String, title: String) {
		self.title = title
		let url = URL.init(string: urlString)
		self.request = URLRequest.init(url: url!)
	}
	
	//MARK: - WKNavigationDelegate
	/// 开始提交请求，当主框架导航开始时，调用“抽象”调用。
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		
	}
	/// 当内容开始到达主框架时，调用抽象调用。
	func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
		
	}
	/// 请求完成
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		
	}
	/// 请求失败
	func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		
	}
	
	//MARK: - KVO的监听代理
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		
		//  加载进度条
		if keyPath == "estimatedProgress" {
			if (object as? WKWebView) == webView {
				progressView.alpha = 1.0
				progressView.setProgress(Float(webView.estimatedProgress), animated: true)
				if webView.estimatedProgress >= 1.0 {
					UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
						self.progressView.alpha = 0.0
					}, completion: { (finish) in
						self.progressView.setProgress(0.0, animated: false)
					})
				}
			}
		}
		// 标题
		else if keyPath == "title" {
			if (object as? WKWebView) == webView {
				self.title = self.webView.title
			}
		}
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
