//___FILEHEADER___

import UIKit
import MJRefresh

class ___FILEBASENAMEASIDENTIFIER___: BaseViewController {
    typealias T = <#ModelType#>
    typealias CellType = <#CellType#>
    
    fileprivate var Identifier = "Identifier"
    fileprivate var list = [T]()
    
    fileprivate var page = 1
    fileprivate var pcount = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initNavBarTitle("<#Title#>",
                        rightButton: .title("<#右上角按钮#>",#selector(pushAction(sender:))))
        
        setupUI()
        setupCollectionView()
        refresh()
    }
    
    // 右上角按钮点击
    @objc func pushAction(sender: UIButton) {
//        let vc = VideoUploadViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private lazy var noDataView: NoDataView = NoDataView()
    open var noDataTuple: (view: UIView?, Image: UIImage?,title: String?,detail: String?, buttonTitle: String?, action: (()->Void)? )
        = (view: nil, Image: nil, title: "没有数据", detail: nil, buttonTitle: nil, action: nil) {
        didSet {
            noDataView.noDataTuple = noDataTuple
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let CellWidth = <#width#>
        let CellHeight = <#height#>
        layout.itemSize = CGSize(width: CellWidth, height: CellHeight)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = UIColor.white
        return view
    }()
}
//MARK: Data Fetch
extension ___FILEBASENAMEASIDENTIFIER___ {
    
    func refresh() {
        page = 1
        self.view.showLoadingHUD()
//        API.VideolibraryIndex(keyword: keyword,
//                              page: page,
//                              pcount: pcount){ [weak self] (res) in
//                                guard let `self` = self else { return }
//                                self.view.hideAllHUDs()
//                                if !res.isSuccess {
//                                    self.view.showInfoHUD(info: res.message)
//                                    return
//                                }
//                                self.addList(res.list)
//        }
    }
    
    func loadMore() {
        page += 1
//        API.VideolibraryIndex(keyword: keyword,
//                              page: page,
//                              pcount: pcount){ [weak self] (res) in
//                                guard let `self` = self else { return }
//                                if !res.isSuccess {
//                                    self.view.showInfoHUD(info: res.message)
//                                    return
//                                }
//                                self.addList(res.list)
//        }
    }
    
    func addList(_ array: [T]) {
        if page == 1 {
            self.list = array
            self.noDataView.isHidden = array.count != 0
            collectionView.mj_header.endRefreshing()
            collectionView.mj_footer.resetNoMoreData()
        } else {
            self.list += array
            collectionView.mj_footer.endRefreshing()
        }
        if array.count < pcount { // 没有更多数据了
            collectionView.mj_footer.endRefreshingWithNoMoreData()
        }
        
        self.collectionView.reloadData()
    }
}

// MARK: - UI init
extension ___FILEBASENAMEASIDENTIFIER___ {
    
    func setupUI() {
        
        view.sv()
        
        view.layout(
            
        )
    }
}

// MARK: - CollectionView
extension ___FILEBASENAMEASIDENTIFIER___: UICollectionViewDataSource,
                                          UICollectionViewDelegate,
                                          UICollectionViewDelegateFlowLayout{
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(withCellType: CellType.self)
        collectionView.mj_header = MJRefreshStateHeader(refreshingBlock: {[weak self] in
            self?.refresh()
        })
        collectionView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {[weak self] in
            self?.loadMore()
        })
        
        noDataView.isHidden = true
        noDataView.noDataTuple = noDataTuple
        collectionView.addSubview(noDataView)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // cell赋值
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: CellType.self, for: indexPath)
        guard let data = list[safe: indexPath.row] else {
            return cell
        }
        // cell赋值
//        cell.config()
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
