import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifire = "MainTableViewCell"
    
    // MARK: - UI Components
    
    private var productImageView = UIImageView()
    private var productLabel = UILabel()
    private var priceLabel = UILabel()
    private var buyButton = UIButton()
    private var descriptionLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            addViews()
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        productImageView.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        productLabel.frame = CGRect(x: 5, y: 110, width: contentView.frame.size.width / 2, height: 20)
        priceLabel.frame = CGRect(x: 5, y: 135, width: contentView.frame.size.width / 2, height: 20)
        buyButton.frame = CGRect(x: 5, y: 160, width: 100, height: 30)
        descriptionLabel.frame = CGRect(x: 5, y: 190, width: contentView.frame.size.width / 2, height: 20)
    }
    
    func configureViews(product: Product) {
        configureProductLabel(product: product.productInfo.name)
        configurePriceLabel(price: product.productInfo.price)
        configureProductImageView(image: product.productInfo.image)
        configureDescriptionLabel(description: product.productInfo.descriptionInfo.information)
        configureBuyButton(price: product.productInfo.price)
    }
    
    // MARK: - Private methods
    
    private func addViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buyButton)
        contentView.addSubview(descriptionLabel)
    }
    
    private func configureProductImageView(image: String) {
        productImageView.image = UIImage(named: image)
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
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
        descriptionLabel.numberOfLines = 0
    }
    
    private func configureBuyButton(price: String) {
        buyButton.setTitle("В корзину", for: .normal)
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.titleLabel?.textAlignment = .left
        buyButton.backgroundColor = .white
        buyButton.layer.cornerRadius = 10
    }
}