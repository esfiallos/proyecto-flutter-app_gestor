class BalanceGeneral {
  final double totalIngresos;
  final double totalEgresos;
  final double balance;

  BalanceGeneral({
    required this.totalIngresos,
    required this.totalEgresos,
    required this.balance,
  });

  
factory BalanceGeneral.fromMap(Map<String, dynamic> map) => BalanceGeneral(
  totalIngresos: (map['total_ingresos'] ?? 0).toDouble(),
  totalEgresos: (map['total_egresos'] ?? 0).toDouble(),
  balance: (map['balance'] ?? 0).toDouble(),
);

}
