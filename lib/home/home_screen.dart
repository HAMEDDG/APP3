import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'profile_screen.dart';
import 'history_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafb),
      body: Stack(
        children: [
          // HEADER GRADIENT
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 100, left: 20, right: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff2563eb), Color(0xff7c3aed)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User avatar
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(
                            LucideIcons.user,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bonjour,", style: TextStyle(color: Colors.white70, fontSize: 14)),
                            Text("Jean-Marc", style: TextStyle(color: Colors.white, fontSize: 18)),
                          ],
                        )
                      ],
                    ),

                    // NOTIFICATION & SETTINGS
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(LucideIcons.bell, color: Colors.white),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "3",
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(LucideIcons.settings, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),

                // STATUS CARD
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Statut actuel", style: TextStyle(color: Colors.grey, fontSize: 14)),
                              SizedBox(height: 4),
                              Text("Niveau de risque", style: TextStyle(fontSize: 22)),
                            ],
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(LucideIcons.trendingDown, color: Colors.green, size: 26),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.shade600,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text("Faible", style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          const Text("Excellentes conditions", style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // MAIN CONTENT
          Positioned.fill(
            top: 250,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  // Connection status
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffeff6ff),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Row(
                      children: [
                        const Icon(LucideIcons.bluetooth, color: Colors.blue),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Capteur ESP32", style: TextStyle(fontSize: 14)),
                              Text("Connecté - Signal fort",
                                  style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Metrics Grid
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    children: [
                      metricCard(LucideIcons.activity, "Respiration", "18", "rpm", Colors.blue),
                      metricCard(LucideIcons.thermometer, "Température", "36.8", "°C", Colors.orange),
                      metricCard(LucideIcons.droplets, "Humidité", "65", "%", Colors.cyan),
                      metricCard(LucideIcons.wind, "Air", "Bon", "CO₂: 420ppm", Colors.green),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Summary
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Résumé du jour", style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 16),
                        summaryRow("Mesures effectuées", "24/24"),
                        summaryRow("Alertes", "0", color: Colors.green),
                        summaryRow("Qualité des données", "Excellente"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const HistoryScreen()),
                            );
                          },
                          child: actionButton(
                            LucideIcons.activity,
                            "Voir l'historique",
                            Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                            );
                          },
                          child: actionButton(
                            LucideIcons.bell,
                            "Gérer les alertes",
                            Colors.purple,
                          ),
                        ),
                        
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // NAVIGATION BAR
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(blurRadius: 15, color: Colors.black12),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navItem(LucideIcons.activity, "Accueil", active: true),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HistoryScreen()),
                      );
                    },
                    child: navItem(LucideIcons.trendingDown, "Historique"),
                  ),
                  
                  GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                            );
                          },
                          child: navItem(LucideIcons.bell, "Alertes"),
                  ),

                  


                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                      );
                    },
                    child: navItem(LucideIcons.user, "Profil"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widgets utilitaires
  Widget metricCard(icon, title, value, unit, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(value, style: const TextStyle(fontSize: 24)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(unit, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget summaryRow(String left, String right, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: const TextStyle(color: Colors.grey)),
          Text(right, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  Widget actionButton(icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.8)]),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget navItem(icon, String label, {bool active = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: active ? Colors.blue.shade100 : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: active ? Colors.blue : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: active ? Colors.blue : Colors.grey)),
      ],
    );
  }
}
