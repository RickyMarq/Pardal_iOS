//
//  OrientaçõesController.swift
//  FakeNews
//
//  Created by Henrique Marques on 16/11/23.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class OrientationController: UIViewController {

    var orientationView: OrientationView?
    var viewModel: OrientationViewModel?
    var layout = PinterestLayout()
    
    override func loadView() {
        self.orientationView = OrientationView()
        self.view = orientationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orientationView?.layoutDelegate(delegate: self)
        self.orientationView?.oritationCollectionViewProtocols(delegate: self, dataSource: self)
        self.viewModel = OrientationViewModel(services: OrientationServices())
        self.viewModel?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configNavigationAppearanceController()
        self.viewModel?.getOrientations()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.outro()
    }
    
    func configNavigationAppearanceController() {
        self.title = "Orientações"
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
    }
    
    func outro() {
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage() 
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}

extension OrientationController: UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let data = viewModel?.indexPath(indexPath: indexPath)
        let height = CGFloat.random(in: 300...600)
        let width = data?.width ?? 0
        
        return CGSize(width: width, height: data?.height ?? 0)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrientationCell.identifier, for: indexPath) as? OrientationCell else {return UICollectionViewCell.init()}
        let data = viewModel?.indexPath(indexPath: indexPath)
        cell.orientationLabel.text = data?.orientationTitle
        cell.iconImageView.sd_setImage(with: URL(string: data?.orientationImage ?? ""))
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let indexData = viewModel?.indexPath(indexPath: indexPath) else {return}
        let vc = OrientationItemController(orientationItem: indexData)

        self.navigationController?.pushViewController(vc, animated: true)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            self.navigationController?.pushViewController(vc, animated: true)
//            self.navigationController?.navigationBar.prefersLargeTitles = true
//        }
    }
}

extension OrientationController: OrientationViewModelProtocol {
  
    func success() {
        DispatchQueue.main.async {
            self.orientationView?.orientationCollectionView.reloadData()
        }
    }
    
    func failure(error: String) {
        
    }
    
}

extension OrientationController: PinterestLayoutDelegate {
  
    func cellSize(indexPath: IndexPath) -> CGSize {
 //       return CGSize(width: 150, height: 150)
        
        let image = viewModel?.indexPath(indexPath: indexPath)
        guard let width = image?.width else {return .zero}
        guard let height = image?.height else {return .zero}
        
        
        print("DEBUG MODE: -> Width \(width)")
        print("DEBUG MODE: -> Height \(height)")
        
        let cellWidth = layout.width
        
        let size = CGSize(width: Int(cellWidth), height: Int(CGFloat((height/width)) * cellWidth))
        return size
    }
}
