import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      "id": 1,
      "type": "alert",
      "title": "Fréquence de toux élevée",
      "message": "15 épisodes détectés dans les 2 dernières heures",
      "time": "Il y a 5 min",
      "read": false,
    },
    {
      "id": 2,
      "type": "info",
      "title": "Synchronisation réussie",
      "message": "Vos données ont été sauvegardées sur le cloud",
      "time": "Il y a 1h",
      "read": false,
    },
    {
      "id": 3,
      "type": "success",
      "title": "Analyse IA terminée",
      "message": "Votre niveau de risque reste faible. Continuez ainsi !",
      "time": "Il y a 3h",
      "read": false,
    },
    {
      "id": 4,
      "type": "info",
      "title": "Rappel : Prise de mesure",
      "message": "N'oubliez pas de porter votre capteur ce soir",
      "time": "Hier",
      "read": true,
    },
    {
      "id": 5,
      "type": "success",
      "title": "Objectif atteint",
      "message": "7 jours consécutifs de surveillance complète",
      "time": "Hier",
      "read": true,
    },
    {
      "id": 6,
      "type": "info",
      "title": "Mise à jour disponible",
      "message": "Une nouvelle version de l'application est disponible",
      "time": "2 jours",
      "read": true,
    },
  ];

  IconData getIcon(String type) {
    switch (type) {
      case 'alert':
        return LucideIcons.alertTriangle;
      case 'success':
        return LucideIcons.checkCircle;
      default:
        return LucideIcons.info;
    }
  }

  Color getIconColor(String type) {
    switch (type) {
      case 'alert':
        return Colors.orange;
      case 'success':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  Color getBgColor(String type) {
    switch (type) {
      case 'alert':
        return Colors.orange.shade100;
      case 'success':
        return Colors.green.shade100;
      default:
        return Colors.blue.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 HEADER
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _circleButton(
                            icon: LucideIcons.arrowLeft,
                            onTap: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      _badge("3 nouvelles"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _filterButton("Toutes", active: true),
                      const SizedBox(width: 10),
                      _filterButton("Non lues"),
                    ],
                  ),
                ],
              ),
            ),

            /// 🔹 LISTE DES NOTIFICATIONS
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: notifications.map((notif) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: notif["read"]
                          ? null
                          : Border.all(color: Colors.blue.shade200, width: 2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: getBgColor(notif["type"]),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            getIcon(notif["type"]),
                            color: getIconColor(notif["type"]),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      notif["title"],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  if (!notif["read"])
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                notif["message"],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                notif["time"],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            /// 🔹 PARAMÈTRES
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: const [
                    _SwitchRow(title: "Alertes de risque", value: true),
                    _SwitchRow(title: "Rappels quotidiens", value: true),
                    _SwitchRow(title: "Mises à jour", value: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({required IconData icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha:0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _filterButton(String text, {bool active = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white.withValues(alpha:0.2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final String title;
  final bool value;

  const _SwitchRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[700])),
          Switch(
            value: value,
            onChanged: (_) {},
            activeThumbColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
