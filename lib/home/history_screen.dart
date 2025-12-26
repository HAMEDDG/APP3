import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<Map<String, dynamic>> weeklyData = const [
    {'day': 'Lun', 'value': 16},
    {'day': 'Mar', 'value': 18},
    {'day': 'Mer', 'value': 17},
    {'day': 'Jeu', 'value': 19},
    {'day': 'Ven', 'value': 18},
    {'day': 'Sam', 'value': 17},
    {'day': 'Dim', 'value': 16},
  ];

  final List<Map<String, String>> history = const [
    {'date': "Aujourd'hui", 'time': '14:30', 'status': 'Faible', 'color': 'green'},
    {'date': "Aujourd'hui", 'time': '08:15', 'status': 'Faible', 'color': 'green'},
    {'date': 'Hier', 'time': '19:45', 'status': 'Moyen', 'color': 'orange'},
    {'date': 'Hier', 'time': '12:20', 'status': 'Faible', 'color': 'green'},
    {'date': '25 Oct', 'time': '16:00', 'status': 'Faible', 'color': 'green'},
    {'date': '25 Oct', 'time': '09:30', 'status': 'Faible', 'color': 'green'},
  ];

  Color _statusColor(String color) {
    switch (color) {
      case 'orange':
        return Colors.orange;
      case 'red':
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 HEADER
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF9333EA)],
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
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Historique",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _filterButton(
                          icon: Icons.calendar_month,
                          label: "7 derniers jours",
                          active: true,
                        ),
                      ),
                      const SizedBox(width: 12),
                      _filterButton(label: "Mois"),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // 📊 GRAPH
                  _card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Fréquence respiratoire",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Moyenne: 17.4 rpm",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          child: BarChart(
                            BarChartData(
                              barGroups: List.generate(
                                weeklyData.length,
                                (i) => BarChartGroupData(
                                  x: i,
                                  barRods: [
                                    BarChartRodData(
                                      toY: weeklyData[i]['value'].toDouble(),
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ],
                                ),
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, _) =>
                                        Text(weeklyData[value.toInt()]['day']),
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true),
                                ),
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 📈 STATS
                  Row(
                    children: [
                      Expanded(
                        child: _statCard(
                          icon: Icons.trending_up,
                          color: Colors.green,
                          title: "Amélioration",
                          value: "+12%",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _statCard(
                          icon: Icons.monitor_heart,
                          color: Colors.blue,
                          title: "Mesures",
                          value: "168",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 📋 HISTORY
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Analyses récentes",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        ...history.map((item) => _historyItem(item)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ⬇ EXPORT
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2563EB), Color(0xFF9333EA)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Exporter les données (PDF)",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HELPERS ----------------

  static Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }

  static Widget _filterButton({IconData? icon, required String label, bool active = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: 18),
          if (icon != null) const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }

  Widget _statCard({required IconData icon, required Color color, required String title, required String value}) {
    return _card(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 12)),
              Text(value, style: const TextStyle(fontSize: 20)),
            ],
          )
        ],
      ),
    );
  }

  Widget _historyItem(Map<String, String> item) {
    final color = _statusColor(item['color']!);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.monitor_heart, color: color),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['date']!),
                  Text(item['time']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(item['status']!, style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          )
        ],
      ),
    );
  }
}
