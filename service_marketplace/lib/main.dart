import 'package:flutter/material.dart';

void main() {
  runApp(const ServiceMarketplaceApp());
}

class ServiceMarketplaceApp extends StatelessWidget {
  const ServiceMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Marketplace',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C8EF5)),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFF1E2432),
          displayColor: const Color(0xFF1E2432),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class Category {
  const Category({required this.title, required this.icon, required this.accent});

  final String title;
  final IconData icon;
  final Color accent;
}

class Worker {
  const Worker({
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
  });

  final String name;
  final String location;
  final double rating;
  final String price;
}

const List<Category> categories = <Category>[
  Category(title: 'Part Time Chef', icon: Icons.restaurant_menu_rounded, accent: Color(0xFFFFE1D6)),
  Category(title: 'Babysitter', icon: Icons.child_care_rounded, accent: Color(0xFFDFF4FF)),
  Category(title: 'Part Time Drivers', icon: Icons.drive_eta_rounded, accent: Color(0xFFE6E1FF)),
  Category(title: 'Plumbers', icon: Icons.plumbing_rounded, accent: Color(0xFFDDF4E4)),
  Category(title: 'Maids', icon: Icons.cleaning_services_rounded, accent: Color(0xFFFFF0C9)),
  Category(
    title: 'Electrician',
    icon: Icons.electrical_services_rounded,
    accent: Color(0xFFFFE0EB),
  ),
];

const Map<String, List<Worker>> workerDirectory = <String, List<Worker>>{
  'Part Time Chef': <Worker>[
    Worker(name: 'Chef Aiman', location: 'Mont Kiara', rating: 4.9, price: 'RM120 / session'),
    Worker(name: 'Chef Nurul', location: 'Bangsar', rating: 4.8, price: 'RM100 / session'),
    Worker(name: 'Chef Daniel', location: 'Petaling Jaya', rating: 4.7, price: 'RM110 / session'),
  ],
  'Babysitter': <Worker>[
    Worker(name: 'Sarah Lim', location: 'Subang Jaya', rating: 4.9, price: 'RM25 / hour'),
    Worker(name: 'Farah Lee', location: 'Ampang', rating: 4.8, price: 'RM22 / hour'),
    Worker(name: 'Alya Tan', location: 'Cheras', rating: 4.7, price: 'RM20 / hour'),
  ],
  'Part Time Drivers': <Worker>[
    Worker(name: 'Hafiz Rahman', location: 'Shah Alam', rating: 4.9, price: 'RM45 / trip'),
    Worker(name: 'Kevin Ong', location: 'Setapak', rating: 4.8, price: 'RM40 / trip'),
    Worker(name: 'Jason Wong', location: 'Puchong', rating: 4.6, price: 'RM38 / trip'),
  ],
  'Plumbers': <Worker>[
    Worker(name: 'Ravi Kumar', location: 'Kelana Jaya', rating: 4.9, price: 'RM90 / visit'),
    Worker(name: 'Muhammad Faiz', location: 'Damansara', rating: 4.7, price: 'RM80 / visit'),
    Worker(name: 'Tan Wei Kit', location: 'Sri Hartamas', rating: 4.8, price: 'RM95 / visit'),
  ],
  'Maids': <Worker>[
    Worker(name: 'Lina Yusuf', location: 'TTDI', rating: 4.8, price: 'RM30 / hour'),
    Worker(name: 'Maya Devi', location: 'Bukit Jalil', rating: 4.9, price: 'RM32 / hour'),
    Worker(name: 'Nur Aisyah', location: 'Sungai Buloh', rating: 4.7, price: 'RM28 / hour'),
  ],
  'Electrician': <Worker>[
    Worker(name: 'Azri Hakim', location: 'Cyberjaya', rating: 4.9, price: 'RM95 / visit'),
    Worker(name: 'Benjamin Low', location: 'Kepong', rating: 4.8, price: 'RM88 / visit'),
    Worker(name: 'Arun Prakash', location: 'Kajang', rating: 4.7, price: 'RM85 / visit'),
  ],
};

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double width = constraints.maxWidth;
            final crossAxisCount = width >= 1100
                ? 4
                : width >= 700
                ? 3
                : 2;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: const LinearGradient(
                            colors: <Color>[Color(0xFFF4F7FF), Color(0xFFFFFBF7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Service Marketplace',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Find trusted services near you',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: const Color(0xFF5B6475),
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Browse Categories',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 18,
                          childAspectRatio: width >= 700 ? 1.18 : 1.02,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final Category category = categories[index];
                          return CategoryCard(category: category);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CategoryListScreen(categoryName: category.title),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const <BoxShadow>[
              BoxShadow(color: Color(0x140F172A), blurRadius: 24, offset: Offset(0, 12)),
            ],
            border: Border.all(color: const Color(0xFFF1F3F8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: category.accent,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(category.icon, color: const Color(0xFF25324A), size: 30),
                ),
                const Spacer(),
                Text(
                  category.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, letterSpacing: 0),
                ),
                const SizedBox(height: 8),
                Text(
                  'View available professionals',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6B7280),
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final List<Worker> workers = workerDirectory[categoryName] ?? <Worker>[];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        title: Text(
          categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E2432),
            letterSpacing: 0,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              itemCount: workers.length,
              separatorBuilder: (_, index) => const SizedBox(height: 16),
              itemBuilder: (BuildContext context, int index) {
                final Worker worker = workers[index];
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(color: Color(0x120F172A), blurRadius: 20, offset: Offset(0, 10)),
                    ],
                    border: Border.all(color: const Color(0xFFF1F3F8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          final bool compact = constraints.maxWidth < 520;

                          final Widget details = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                worker.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 12,
                                runSpacing: 8,
                                children: <Widget>[
                                  _InfoChip(
                                    icon: Icons.location_on_outlined,
                                    label: worker.location,
                                  ),
                                  _InfoChip(
                                    icon: Icons.star_rounded,
                                    label: worker.rating.toStringAsFixed(1),
                                    iconColor: const Color(0xFFF4B740),
                                  ),
                                  _InfoChip(icon: Icons.payments_outlined, label: worker.price),
                                ],
                              ),
                            ],
                          );

                          final Widget button = FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xFF1E2432),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0),
                            ),
                          );

                          if (compact) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                details,
                                const SizedBox(height: 18),
                                SizedBox(width: double.infinity, child: button),
                              ],
                            );
                          }

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(child: details),
                              const SizedBox(width: 20),
                              button,
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    this.iconColor = const Color(0xFF6C8EF5),
  });

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF4B5563),
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
