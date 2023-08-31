import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModel = MainViewModelImp()
    weak var coordinator: AppCoordinator?
    private let tableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = .white
    }
    
    func setupViewModel() {
        
        viewModel.updateData = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
        
        viewModel.showLoading = {
            DispatchQueue.main.async { self.activityIndicator.startAnimating() }
        }
        
        viewModel.hideLoading = {
            DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
        }
    }
    
    // MARK: - SetupTableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        constraintsTableView()
    }
    
    private func registerCell() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.cellReuseIdentifire)
    }
    
    private func constraintsTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellReuseIdentifire, for: indexPath) as? MainTableViewCell else { return UITableViewCell()}
        let product = viewModel.products[indexPath.row]
        cell.configureViews(product: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
