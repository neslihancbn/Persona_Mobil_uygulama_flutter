import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Sepetiniz boş', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: SizedBox(
                    width: 56,
                    child: Image.network(item.product.image, fit: BoxFit.cover),
                  ),
                  title: Text(item.product.title),
                  subtitle: Text('₺${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => cart.updateQuantity(item.product, item.quantity - 1),
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => cart.updateQuantity(item.product, item.quantity + 1),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: cart.items.length,
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Toplam: ₺${cart.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Simulate checkout
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Siparişi Onayla'),
                          content: const Text('Siparişi onaylamak istiyor musunuz? (Simülasyon)'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
                            ElevatedButton(
                              onPressed: () {
                                cart.clear();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sipariş alındı (simülasyon).')));
                              },
                              child: const Text('Onayla'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Sipariş Ver'),
                  ),
                ],
              ),
            ),
    );
  }
}
