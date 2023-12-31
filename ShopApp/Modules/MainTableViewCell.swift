import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifire = "MainTableViewCell"
    
    // MARK: - UI Components
    
    private var productImageView = UIImageView()
    private var productTitleLabel = UILabel()
    private var priceLabel = UILabel()
    private var buyButton = UIButton()
    private var descriptionProductLabel = UILabel()
    
    // MARK: - Properties
    
    private let constant = Constant()
    
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
        layout()
    }
    
    private func layout() {
        productImageView.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        
        let heightProductLabel = UILabel.textHeight(withWidth: contentView.bounds.width / 2,
                                                    font: productTitleLabel.font,
                                                    text: productTitleLabel.text ?? "")
        
        productTitleLabel.frame = CGRect(x: productImageView.frame.minX + 5,
                                         y: productImageView.frame.maxY + 8,
                                         width: contentView.bounds.width / 2,
                                         height: heightProductLabel)
        
        let heightPriceLabel = UILabel.textHeight(withWidth: contentView.bounds.width / 2,
                                                  font: priceLabel.font,
                                                  text: priceLabel.text ?? "")
        
        priceLabel.frame = CGRect(x: productTitleLabel.frame.minX,
                                  y: productTitleLabel.frame.maxY + 8,
                                  width: contentView.bounds.width / 2,
                                  height: heightPriceLabel)
        
        buyButton.frame = CGRect(x: priceLabel.frame.minX,
                                 y: priceLabel.frame.maxY + 8,
                                 width: priceLabel.frame.width,
                                 height: productImageView.frame.height / 5 + 5)
        
        let height = UILabel.textHeight(withWidth: descriptionProductLabel.frame.width,
                                        font: descriptionProductLabel.font,
                                        text: descriptionProductLabel.text ?? "")
        
        descriptionProductLabel.frame = CGRect(x: buyButton.frame.minX,
                                               y: buyButton.frame.maxY + 8,
                                               width: contentView.bounds.width / 2,
                                               height: height)
    }
    
    func configureViews(product: Product) {
        configureProductTitleLabel(product: product.productInfo.name)
        configurePriceLabel(price: product.productInfo.price)
        configureProductImageView(image: product.productInfo.image)
        configureDescriptionLabel(description: product.productInfo.descriptionInfo.information)
        configureBuyButton(price: product.productInfo.price)
    }
    
    // MARK: - Private methods
    
    private func addViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productTitleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buyButton)
        contentView.addSubview(descriptionProductLabel)
    }
    
    private func configureProductImageView(image: String) {
        productImageView.image = UIImage(named: image)
        productImageView.contentMode = .scaleAspectFit
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10
    }
    
    private func configureProductTitleLabel(product: String) {
        productTitleLabel.text = product
        productTitleLabel.numberOfLines = 0
        productTitleLabel.font = UIFont(name: constant.avenirBook, size: 25)
    }
    		
    private func configurePriceLabel(price: String) {
        priceLabel.text = price
        priceLabel.font = UIFont(name: constant.avenirBook, size: 20)
    }
    
    private func configureDescriptionLabel(description: String) {
        descriptionProductLabel.text = description
        descriptionProductLabel.numberOfLines = 0
        descriptionProductLabel.font = UIFont(name: constant.avenirBook, size: 15)
    }
    
    private func configureBuyButton(price: String) {
        buyButton.setTitle("В корзину", for: .normal)
        buyButton.setTitle("Убрать из корзины", for: .highlighted)
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.titleLabel?.font = UIFont(name: constant.avenirBook, size: 20)
        buyButton.backgroundColor = .lightGray
        buyButton.layer.cornerRadius = 10
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        
        return CGSize(width: contentView.frame.width, height: descriptionProductLabel.frame.maxY + 10)
    }
}
