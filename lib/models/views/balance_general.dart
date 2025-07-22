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
    totalIngresos: map['total_ingresos'] ?? 0.0,
    totalEgresos: map['total_egresos'] ?? 0.0,
    balance: map['balance'] ?? 0.0,
  );
}
