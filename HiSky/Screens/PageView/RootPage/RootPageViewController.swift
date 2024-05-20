//
//  RootPageViewController.swift
//  HiSky
//
//  Created by Nguyen Van Hien on 26/4/24.
//

import UIKit

class RootPageViewController: UIPageViewController {
    var currentPage: Int = 0
    var pageIndicappearence = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
    
    lazy var vcArray: [UIViewController] = {
        let newFeedVC = NewFeedViewController()
        let watchVC = WatchViewController()
        let friendRequestVC = FriendRequestViewController()
        let shopVC = ShopViewController()
        let notificationVC = NotificationViewController()
        let settingVC = SettingViewController()
        return [newFeedVC, watchVC, friendRequestVC, shopVC, notificationVC, settingVC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let vc = vcArray.first{
            self.setViewControllers([vc], direction: .forward, animated: true)
        }
        self.setupProperties()
    }
    
    override func viewDidLayoutSubviews() {
        //set view fullscreen
        for subview in self.view.subviews{
            if subview is UIScrollView{
                subview.frame = self.view.bounds
            }
        }
        super.viewDidLayoutSubviews()
    }
    
    private func setupProperties(){
//        pageIndicappearence.pageIndicatorTintColor = .gray
//        pageIndicappearence.currentPageIndicatorTintColor = .white
        pageIndicappearence.isHidden = true
    }

}

extension RootPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.lastIndex(of: viewController) else {return nil}
        let previousIndex = index - 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcArray.count else {return nil}
        currentPage = index - 1
        return vcArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.lastIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        guard nextIndex >= 0 else { return nil }
        guard nextIndex < vcArray.count else { return nil }
        currentPage = nextIndex
        return vcArray[nextIndex]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentPage
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vcArray.count
    }
}
