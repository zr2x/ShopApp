import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModel = MainViewModel()
    weak var coordinator: AppCoordinator?
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = .white
    }
    
    // MARK: - SetupTableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
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
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellReuseIdentifire, for: indexPath) as? MainTableViewCell else { return UITableViewCell()}
        // FIXME: fix this
        cell.configureViews(product: viewModel.product ?? Product(productInfo: ProductInfo(image: "Test", name: "Milk", id: 10, price: "300 rub", deliveryInfo: "30 august", descriptionInfo: DescriptionInfo(count: 100, information: "No info available"))))
        return cell
    }
}
