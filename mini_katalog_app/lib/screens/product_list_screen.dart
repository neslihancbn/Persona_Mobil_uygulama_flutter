import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  final String? category;

  const ProductListScreen({super.key, this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    // Load local JSON (simple original behavior)
    Future.delayed(const Duration(milliseconds: 200), () async {
      try {
        final jsonString = await rootBundle.loadString('assets/data/products.json');
        final List<dynamic> jsonList = json.decode(jsonString);
        setState(() {
          products = jsonList.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
          _applyFilters();
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          products = _getDummyProducts();
          _applyFilters();
          isLoading = false;
        });
      }
    });
  }

  void _applyFilters() {
    filteredProducts = products.where((product) {
      // Kategori filtresi
      if (widget.category != null && widget.category!.isNotEmpty) {
        if (product.category.toLowerCase() != widget.category!.toLowerCase()) {
          return false;
        }
      }

      // Arama filtresi
      if (searchQuery.isNotEmpty) {
        return product.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            product.description.toLowerCase().contains(searchQuery.toLowerCase());
      }

      return true;
    }).toList();
  }

  List<Product> _getDummyProducts() {
    return [
      Product(
        id: 1,
        title: 'Akıllı Telefon',
        description: 'Son teknoloji akıllı telefon, 128GB depolama alanı',
        price: 8999.99,
        image: 'https://via.placeholder.com/400x400.png?text=Telefon',
        category: 'electronics',
      ),
      Product(
        id: 2,
        title: 'Dizüstü Bilgisayar',
        description: 'Güçlü işlemci, 16GB RAM, 512GB SSD',
        price: 15999.99,
        image: 'https://via.placeholder.com/400x400.png?text=Laptop',
        category: 'electronics',
      ),
      Product(
        id: 3,
        title: 'Kablosuz Kulaklık',
        description: 'Gürültü önleyici, 30 saat pil ömrü',
        price: 1299.99,
        image: 'https://via.placeholder.com/400x400.png?text=Kulaklik',
        category: 'electronics',
      ),
      Product(
        id: 4,
        title: 'Spor Ayakkabı',
        description: 'Rahat, hafif ve şık tasarım',
        price: 599.99,
        image: 'https://via.placeholder.com/400x400.png?text=Ayakkabi',
        category: 'clothing',
      ),
      Product(
        id: 5,
        title: 'Kot Pantolon',
        description: 'Slim fit, %100 pamuk',
        price: 299.99,
        image: 'https://via.placeholder.com/400x400.png?text=Pantolon',
        category: 'clothing',
      ),
      Product(
        id: 6,
        title: 'Akıllı Saat',
        description: 'Nabız, adım sayar, su geçirmez',
        price: 2499.99,
        image: 'https://via.placeholder.com/400x400.png?text=Saat',
        category: 'electronics',
      ),
      Product(
        id: 7,
        title: 'Tişört',
        description: 'Pamuklu, çeşitli renklerde',
        price: 149.99,
        image: 'https://via.placeholder.com/400x400.png?text=Tisort',
        category: 'clothing',
      ),
      Product(
        id: 8,
        title: 'Tablet',
        description: '10.1 inç ekran, 64GB depolama',
        price: 4999.99,
        image: 'https://via.placeholder.com/400x400.png?text=Tablet',
        category: 'electronics',
      ),
      Product(
        id: 9,
        title: 'Sırt Çantası',
        description: 'Laptop bölmeli, su geçirmez',
        price: 399.99,
        image: 'https://via.placeholder.com/400x400.png?text=Canta',
        category: 'other',
      ),
      Product(
        id: 10,
        title: 'Kamera',
        description: '24MP, 4K video kaydı',
        price: 12999.99,
        image: 'https://via.placeholder.com/400x400.png?text=Kamera',
        category: 'electronics',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category == null 
              ? 'Tüm Ürünler' 
              : '${_getCategoryName()} Ürünleri',
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                _loadProducts();
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Arama çubuğu
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ürün ara...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            searchQuery = '';
                            _applyFilters();
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  _applyFilters();
                });
              },
            ),
          ),

          // Ürün listesi
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inbox,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Ürün bulunamadı',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: filteredProducts[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: filteredProducts[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  String _getCategoryName() {
    switch (widget.category?.toLowerCase()) {
      case 'electronics':
        return 'Elektronik';
      case 'clothing':
        return 'Giyim';
      case 'other':
        return 'Diğer';
      default:
        return 'Tüm';
    }
  }
}
