import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifire = "MainTableViewCell"
    
    // MARK: - UI Components
    
    private var productImageView = UIImageView()
    private var productLabel = UILabel()
    private var priceLabel = UILabel()
    private var buyButton = UIButton()
    private var descriptionLabel = UILabel()
    private var stackView = UIStackView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
    func configureViews(product: Product) {
        separatorInset = UIEdgeInsets(top: 15, left: 55, bottom: 0, right: 0)
        
        addViews()
        configureStackVIew()
        
        configureProductLabel(product: product.productInfo.name)
        configurePriceLabel(price: product.productInfo.price)
        configureProductImageView(image: product.productInfo.image)
        configureDescriptionLabel(description: product.productInfo.descriptionInfo.information)
        configureBuyButton(price: product.productInfo.price)
    }
    
    // MARK: - Private methods
    
    private func addViews() {
        addSubview(stackView)
    }
    
    private func configureStackVIew() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 2
        
        stackView.addArrangedSubview(productImageView)
        stackView.addArrangedSubview(productLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(buyButton)
    }
    
    private func configureProductImageView(image: String) {
        productImageView.image = UIImage(named: image)
    }
    
    private func configureProductLabel(product: String) {
        productLabel.text = product
        productLabel.numberOfLines = 0
    }
    
    private func configurePriceLabel(price: String) {
        priceLabel.text = price
    }
    
    private func configureDescriptionLabel(description: String) {
        descriptionLabel.text = description
    }
    
    private func configureBuyButton(price: String) {
        buyButton.setTitle("В корзину", for: .normal)
        buyButton.setTitleColor(.black, for: .normal)
    }
    
    // MARK: Layout method
    private func configureLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
