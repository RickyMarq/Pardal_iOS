//
//  ViewController.swift
//  FakeNews
//
//  Created by Henrique Marques on 29/10/23.
//

import UIKit
import SDWebImage
import SkeletonView

class HomeController: UIViewController {
    
    var homeView: HomeView?
    var viewModel: HomeViewModel?
    
    override func loadView() {
        self.homeView = HomeView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSkeletonView()
        viewModel = HomeViewModel(services: HomeService())
        self.configNavigationAppearanceController()
        self.homeView?.delegate(delegate: self)
        self.homeView?.homeCollectionViewProtocols(delegate: self, dataSource: self)
        self.getCompositionalLayout()
        self.viewModel?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showSkeletonView()
        self.getDataSection()
        self.getNews()
    }
    
    func configNavigationAppearanceController() {
        self.title = "Pardal"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 14/255, green: 43/255, blue: 88/255, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .label

        let addTabButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: nil, action: nil)
        addTabButton.tintColor = .white
        navigationItem.rightBarButtonItem = addTabButton
    }
    
    func getDataSection() {
        viewModel?.getSectionData()
    }
    
    func showSkeletonView() {
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .topBottom)
        self.homeView?.homeCollectionView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .amethyst), animation: animation)
    }
    
    func getNews() {
        viewModel?.getNewsData()
    }

}

extension HomeController: HomeViewProtocol {
    
    func searchRefreshAction() {
        self.homeView?.searchRefreshControl.endRefreshing()
    }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, SkeletonCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return HomeCollectionCell.identifier
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return viewModel?.sectionCount ?? 0
        case 1:
            return viewModel?.newsCount ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.identifier, for: indexPath) as? HomeCollectionCell else {return UICollectionViewCell()}
            let data = viewModel?.indexPath(indexPath: indexPath)
            cell.titleCollectionLabel.text = data?.SectionName
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionCell.identifier, for: indexPath) as? NewsCollectionCell else {return UICollectionViewCell()}
            let index = viewModel?.newsindexPath(indexPath: indexPath)
            cell.newsImageView.sd_setImage(with: URL(string: index?.newsImage ?? ""))
            cell.newsProviderLabel.text = index?.newsProvider
            cell.newsDescriptionLabel.text = index?.newsDescription 
            cell.newsNameLabel.text = index?.newsTitle
            cell.newsDateLabel.text = index?.newsDate
            return cell
        default:
            return UICollectionViewCell.init()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeader.identifier, for: indexPath) as? TitleHeader
            header?.titleCollectionLabel.text = "Conteúdos"
            return header ?? UICollectionReusableView()
            
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeader.identifier, for: indexPath) as? TitleHeader
            header?.titleCollectionLabel.text = "Notícias Verificadas"
            return header ?? UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
        
}

extension HomeController {
    
    func getCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) in

            switch sectionNumber {

            case 0:
                return HomeLayoutEnum.largeSection.getLayout()
            case 1:
                return HomeLayoutEnum.genreSection.getLayout()
            default:
                return HomeLayoutEnum.largeSection.getLayout()
            }
        }
        self.homeView?.homeCollectionView.setCollectionViewLayout(layout, animated: true)

    }
    
}

extension HomeController: HomeViewModelProtocol {
    
    func success() {
        DispatchQueue.main.async {
            self.homeView?.homeCollectionView.reloadData()
            self.homeView?.stopSkeletonAnimation()
            self.homeView?.homeCollectionView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        }
    }
    
    func failure(error: String) {
        print(error)
    }

}
