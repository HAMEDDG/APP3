import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.only(top: 60, bottom: 40, left: 20, right: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF9333EA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  // Back button + Title
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Mon Profil",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // PROFILE CARD
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                        // Avatar
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF9333EA)],
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "JM",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        

                        const SizedBox(width: 15),

                        // Name + Tag + Badge
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Jean-Marc Kouassi",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              const Text("Patient ID: #P001234",
                                  style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 6),

                              // Badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green[600],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "Compte vérifié",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),

                              )
                            ],
                          ),
                        ),
                        ],
                      ),

                      const SizedBox(height: 6),

                       Container(
                          width: 400,
                          height: 30,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF9333EA)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Modifier le profil",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                       ],
                    ),
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -10), // x = gauche, y = haut
  
            ),


            // CONTENT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // PERSONAL INFO CARD
                  _buildInfoCard(
                    title: "Informations personnelles",
                    children: [
                      _infoTile(Icons.calendar_month, Colors.blue, "Date de naissance",
                          "15 Mars 1990 (34 ans)"),
                           const SizedBox(height: 10),

                      _infoTile(Icons.phone, Colors.green, "Téléphone", "+225 07 12 34 56 78"),
                       const SizedBox(height: 10),

                      _infoTile(Icons.email, Colors.purple, "Email", "jm.kouassi@email.ci"),
                       const SizedBox(height: 10),

                      _infoTile(Icons.location_on, Colors.orange, "Localisation", "Abidjan, Cocody"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // MEDICAL INFO
                  _buildInfoCard(
                    title: "Informations médicales",
                    children: [
                      _medicalRow("Groupe sanguin", "O+"),
                      _medicalRow("Allergies", "Aucune"),
                      _medicalRow("Médecin traitant", "Dr. Kouadio", highlight: true),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // STATS CARD
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE0F2FE), Color(0xFFF3E8FF)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.yellow[100],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(Icons.emoji_events,
                                  color: Colors.orange, size: 28),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Suivi continu",
                                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("28 jours", style: TextStyle(fontSize: 24)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            _StatItem("672", "Mesures"),
                            _StatItem("95%", "Compliance"),
                            _StatItem("12", "Rapports"),
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // SETTINGS CARD
                  _buildInfoCard(
                    title: "Paramètres",
                    children: [
                      _settingsItem(Icons.bluetooth, "Appareils connectés"),
                      _settingsItem(Icons.shield, "Confidentialité et sécurité"),
                      _settingsItem(Icons.description, "Mes documents"),
                      _settingsItem(Icons.help_outline, "Aide et support"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // LOGOUT BUTTON
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 10),
                        Text("Se déconnecter",
                            style: TextStyle(color: Colors.red, fontSize: 16)),
                      ],
                    ),
                  ),

                 
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // -----------------------
  // WIDGET HELPERS
  // -----------------------

  Widget _buildInfoCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          ...children
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, Color color, String label, String value) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        )
      ],
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

  Widget _medicalRow(String label, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              color: highlight ? Colors.blue : Colors.black,
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _settingsItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 12),
              Text(label),
            ],
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

// STATS ITEM WIDGET

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem(this.count, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 22)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
