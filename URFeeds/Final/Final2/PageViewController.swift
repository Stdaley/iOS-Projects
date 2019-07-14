//
//  PageViewController.swift
//  Final2
//
//  Created by Shania Daley on 4/30/19.
//  Copyright © 2019 Minyen chiang. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        configurePageControl()
        if let firstVController = orderedViewControllers.first {
            setViewControllers([firstVController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
            pageControl.numberOfPages = orderedViewControllers.count
            pageControl.currentPage = 0
            pageControl.tintColor = UIColor.black
            pageControl.pageIndicatorTintColor = UIColor.white
            pageControl.currentPageIndicatorTintColor = UIColor.black
            self.view.addSubview(pageControl)
        
    }
    
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVC(viewController: "first"),self.newVC(viewController: "sbRed"),self.newVC(viewController: "sbYellow"),
        self.newVC(viewController: "fb"),self.newVC(viewController: "new")]
    }()
    
    func newVC(viewController: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return orderedViewControllers.last }
        guard orderedViewControllers.count > previousIndex else {return nil}
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        let nextIndex = viewControllerIndex + 1
        guard orderedViewControllers.count != nextIndex else { return orderedViewControllers.first }
        guard orderedViewControllers.count > nextIndex else {return nil}
        
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        let pageContentViewCotroller = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewCotroller)!
    }
    
    
}
